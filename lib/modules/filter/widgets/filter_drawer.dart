import 'package:stylish_app/packages/packages.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filter",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildSectionTitle("Price Range"),
                  RangeSlider(
                    values: _currentRangeValues,
                    min: 0,
                    max: 1000,
                    divisions: 100,
                    activeColor: const Color(0xFFF83758),
                    labels: RangeLabels(
                      "\$${_currentRangeValues.start.round()}",
                      "\$${_currentRangeValues.end.round()}",
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${_currentRangeValues.start.round()}",
                        style: GoogleFonts.montserrat(),
                      ),
                      Text(
                        "\$${_currentRangeValues.end.round()}",
                        style: GoogleFonts.montserrat(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("Colors"),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    children: [
                      _buildColorOption(Colors.black, true),
                      _buildColorOption(Colors.red, false),
                      _buildColorOption(Colors.blue, false),
                      _buildColorOption(Colors.green, false),
                      _buildColorOption(Colors.yellow, false),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("Sizes"),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildSizeChip("XS", false),
                      _buildSizeChip("S", true),
                      _buildSizeChip("M", false),
                      _buildSizeChip("L", false),
                      _buildSizeChip("XL", false),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle("Category"),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildCategoryChip("All", true),
                      _buildCategoryChip("Women", false),
                      _buildCategoryChip("Men", false),
                      _buildCategoryChip("Kids", false),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Discard",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF83758),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Apply",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
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
      style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildColorOption(Color color, bool isSelected) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: isSelected
          ? const Icon(Icons.check, color: Colors.white, size: 20)
          : null,
    );
  }

  Widget _buildSizeChip(String label, bool isSelected) {
    return Chip(
      label: Text(
        label,
        style: GoogleFonts.montserrat(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 12,
        ),
      ),
      backgroundColor: isSelected ? const Color(0xFFF83758) : Colors.white,
      side: BorderSide(
        color: isSelected ? const Color(0xFFF83758) : Colors.grey.shade300,
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), // Material 3 Chip handles shape differently usually
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: const Color(0xFFF83758),
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
      onSelected: (bool selected) {},
    );
  }
}
