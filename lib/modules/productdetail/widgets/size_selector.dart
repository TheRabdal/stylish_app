import 'package:stylish_app/packages/packages.dart';
import '../models/product_detail_models.dart';

class SizeSelector extends StatelessWidget {
  final List<ProductSize> sizes;
  final Function(String) onSizeSelected;

  const SizeSelector({
    super.key,
    required this.sizes,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size: ${sizes.firstWhere((s) => s.isSelected, orElse: () => sizes.first).label}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: sizes.map((size) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () {
                    if (size.isAvailable) {
                      onSizeSelected(size.label);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: size.isSelected
                          ? const Color(0xFFFA7189)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: size.isSelected
                            ? const Color(0xFFFA7189)
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      size.label,
                      style: TextStyle(
                        color: size.isSelected
                            ? Colors.white
                            : const Color(0xFFFA7189),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
