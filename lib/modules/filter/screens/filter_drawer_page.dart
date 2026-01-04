import 'package:stylish_app/packages/packages.dart';

class FilterDrawerPage extends StatefulWidget {
  final RangeValues? initialPriceRange;
  const FilterDrawerPage({super.key, this.initialPriceRange});

  @override
  State<FilterDrawerPage> createState() => _FilterDrawerPageState();
}

class _FilterDrawerPageState extends State<FilterDrawerPage> {
  late RangeValues _currentRangeValues;
  late TextEditingController _minPriceController;
  late TextEditingController _maxPriceController;

  String _selectedCategory = "All";
  String _selectedSize = "M";
  Color _selectedColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _currentRangeValues =
        widget.initialPriceRange ?? const RangeValues(0, 1000);
    _minPriceController = TextEditingController(
      text: _currentRangeValues.start.round().toString(),
    );
    _maxPriceController = TextEditingController(
      text: _currentRangeValues.end.round().toString(),
    );
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  void _handleDiscard() {
    setState(() {
      _currentRangeValues = const RangeValues(0, 1000);
      _minPriceController.text = "0";
      _maxPriceController.text = "1000";
      _selectedCategory = "All";
      _selectedSize = "M";
      _selectedColor = Colors.black;
    });
  }

  void _handleApply() {
    double min = double.tryParse(_minPriceController.text) ?? 0;
    double max = double.tryParse(_maxPriceController.text) ?? 1000;
    if (min > max) {
      double temp = min;
      min = max;
      max = temp;
    }

    Navigator.pop(context, {
      'priceRange': RangeValues(min, max),
      'category': _selectedCategory,
      'size': _selectedSize,
      'color': _selectedColor,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: SafeArea(
        child: Column(
          children: [
            const FilterHeader(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                children: [
                  PriceRangeSection(
                    minPriceController: _minPriceController,
                    maxPriceController: _maxPriceController,
                  ),
                  const SizedBox(height: 32),
                  ColorFilterSection(
                    selectedColor: _selectedColor,
                    onColorSelected: (color) {
                      setState(() {
                        _selectedColor = color;
                      });
                    },
                  ),
                  const SizedBox(height: 32),
                  SizeFilterSection(
                    selectedSize: _selectedSize,
                    onSizeSelected: (size) {
                      setState(() {
                        _selectedSize = size;
                      });
                    },
                  ),
                  const SizedBox(height: 32),
                  CategoryFilterSection(
                    selectedCategory: _selectedCategory,
                    onCategorySelected: (category) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            FilterActionButtons(
              onDiscard: _handleDiscard,
              onApply: _handleApply,
            ),
          ],
        ),
      ),
    );
  }
}
