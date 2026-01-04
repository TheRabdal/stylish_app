import 'package:stylish_app/packages/packages.dart';

class FilterDrawer extends StatefulWidget {
  final RangeValues? initialPriceRange;
  const FilterDrawer({super.key, this.initialPriceRange});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  late RangeValues _currentRangeValues;
  late TextEditingController _minPriceController;
  late TextEditingController _maxPriceController;

  // Selection States
  String _selectedCategory = "All";
  String _selectedSize = "M"; // Default selection
  Color _selectedColor = Colors.black; // Default selection

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
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFC4C4C4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filter",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                children: [
                  _buildSectionTitle("Price Range"),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _minPriceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "Min",
                            prefixText: "₹ ",
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "-",
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          controller: _maxPriceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "Max",
                            prefixText: "₹ ",
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  _buildSectionTitle("Colors"),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      _buildColorOption(Colors.black),
                      _buildColorOption(Colors.red),
                      _buildColorOption(const Color(0xFF1E88E5)), // Pro Blue
                      _buildColorOption(const Color(0xFF43A047)), // Pro Green
                      _buildColorOption(const Color(0xFFFDD835)), // Pro Yellow
                    ],
                  ),
                  const SizedBox(height: 32),

                  _buildSectionTitle("Sizes"),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildSizeChip("XS"),
                      _buildSizeChip("S"),
                      _buildSizeChip("M"),
                      _buildSizeChip("L"),
                      _buildSizeChip("XL"),
                      _buildSizeChip("XXL"), // Added XXL
                    ],
                  ),
                  const SizedBox(height: 32),

                  _buildSectionTitle("Category"),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _buildCategoryChip("All"),
                      _buildCategoryChip("Women"),
                      _buildCategoryChip("Men"),
                      _buildCategoryChip("Kids"),
                      _buildCategoryChip("Boys"), // More categories
                      _buildCategoryChip("Girls"),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _currentRangeValues = const RangeValues(0, 1000);
                          _minPriceController.text = "0";
                          _maxPriceController.text = "1000";
                          _selectedCategory = "All";
                          _selectedSize = "M";
                          _selectedColor = Colors.black;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colors.grey.shade400),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Discard",
                        style: GoogleFonts.montserrat(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Parse values
                        double min =
                            double.tryParse(_minPriceController.text) ?? 0;
                        double max =
                            double.tryParse(_maxPriceController.text) ?? 1000;
                        if (min > max) {
                          // Swap if user inverted inputs
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
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF83758),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Apply",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    bool isSelected = _selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(
                  color: const Color(0xFFF83758),
                  width: 2,
                ) // Highlight selected
              : Border.all(color: Colors.grey.shade300),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withValues(alpha: 0.4),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: isSelected
            ? const Center(
                child: Icon(Icons.check, color: Colors.white, size: 20),
              ) // Adjust icon color based on background if needed
            : null,
      ),
    );
  }

  Widget _buildSizeChip(String label) {
    bool isSelected = _selectedSize == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF83758) : Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFFF83758) : Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    bool isSelected = _selectedCategory == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF83758) : Colors.transparent,
          borderRadius: BorderRadius.circular(
            20,
          ), // More rounded for categories
          border: Border.all(
            color: isSelected ? const Color(0xFFF83758) : Colors.grey.shade400,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
