import 'package:stylish_app/packages/packages.dart';

class AppSearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final VoidCallback? onChanged;
  final bool autofocus;

  const AppSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.autofocus = false,
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
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
          widget.controller?.text = result.recognizedWords;
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
    return Center(
      child: SizedBox(
        width: 343,
        height: 40,
        child: CustomTextField(
          controller: widget.controller,
          onChanged: (_) => widget.onChanged?.call(),
          autofocus: widget.autofocus,
          hint: _isListening ? "Listening..." : "Search any Product..",
          icon: Icons.search,
          contentPadding: EdgeInsets.zero,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.controller?.text.isNotEmpty ?? false)
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.clear, color: Colors.grey, size: 20),
                  onPressed: () {
                    widget.controller?.clear();
                    FocusScope.of(context).unfocus();
                    widget.onChanged?.call();
                  },
                ),
              const SizedBox(width: 8),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  _isListening ? Icons.mic : Icons.mic_none,
                  color: _isListening ? const Color(0xFFF83758) : Colors.grey,
                  size: 20,
                ),
                onPressed: _isListening ? _stopListening : _startListening,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
