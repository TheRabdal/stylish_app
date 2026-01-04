import 'package:stylish_app/packages/packages.dart';

class ColorFilterSection extends StatelessWidget {
  final Color selectedColor;
  final Function(Color) onColorSelected;

  const ColorFilterSection({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Colors",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            _buildColorOption(Colors.black),
            _buildColorOption(Colors.red),
            _buildColorOption(const Color(0xFF1E88E5)),
            _buildColorOption(const Color(0xFF43A047)),
            _buildColorOption(const Color(0xFFFDD835)),
          ],
        ),
      ],
    );
  }

  Widget _buildColorOption(Color color) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () => onColorSelected(color),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(color: const Color(0xFFF83758), width: 2)
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
              )
            : null,
      ),
    );
  }
}
