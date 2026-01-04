import 'package:stylish_app/packages/packages.dart';

class SizeFilterSection extends StatelessWidget {
  final String selectedSize;
  final Function(String) onSizeSelected;

  const SizeFilterSection({
    super.key,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sizes",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
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
            _buildSizeChip("XXL"),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeChip(String label) {
    bool isSelected = selectedSize == label;
    return GestureDetector(
      onTap: () => onSizeSelected(label),
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
}
