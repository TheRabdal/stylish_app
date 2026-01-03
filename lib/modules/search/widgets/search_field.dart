import 'package:stylish_app/packages/packages.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final bool autofocus;
  final VoidCallback? onChanged;

  const SearchField({
    super.key,
    required this.controller,
    this.autofocus = false,
    this.onChanged,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    if (mounted) setState(() {});
  }

  void _startListening() async {
    if (!_speechEnabled) return;

    await _speechToText.listen(
      onResult: (result) {
        if (!mounted) return;
        setState(() {
          widget.controller.text = result.recognizedWords;
          widget.onChanged?.call();
        });
      },
    );
    if (mounted) {
      setState(() {
        _isListening = true;
      });
    }
  }

  void _stopListening() async {
    await _speechToText.stop();
    if (mounted) {
      setState(() {
        _isListening = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CustomTextField(
        autofocus: widget.autofocus,
        controller: widget.controller,
        hint: _isListening ? "Listening..." : "Search for items...",
        icon: Icons.search,
        onChanged: (value) => widget.onChanged?.call(),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.controller.text.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  widget.controller.clear();
                  FocusScope.of(context).unfocus();
                  widget.onChanged?.call(); // Trigger update on clear
                },
              ),
            IconButton(
              icon: Icon(
                _isListening ? Icons.mic : Icons.mic_none,
                color: _isListening ? const Color(0xFFF83758) : Colors.grey,
              ),
              onPressed: _isListening ? _stopListening : _startListening,
            ),
          ],
        ),
      ),
    );
  }
}
