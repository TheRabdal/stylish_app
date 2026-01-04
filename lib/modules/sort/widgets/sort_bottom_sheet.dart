import 'package:stylish_app/packages/packages.dart';

class SortBottomSheet extends StatelessWidget {
  final String? currentSort;

  const SortBottomSheet({super.key, this.currentSort});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Sort By",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildSortOption(context, "Relevance"),
          _buildSortOption(context, "Popular"),
          _buildSortOption(context, "Price: Low to High"),
          _buildSortOption(context, "Price: High to Low"),
          _buildSortOption(context, "Newest"),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSortOption(BuildContext context, String title) {
    final bool isSelected = currentSort == title;

    return InkWell(
      onTap: () {
        Navigator.pop(context, title);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        color: isSelected ? const Color(0xFFFBE8EB) : Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? const Color(0xFFF83758) : Colors.black,
              ),
            ),
            if (isSelected)
              const Icon(Icons.check, color: Color(0xFFF83758), size: 20),
          ],
        ),
      ),
    );
  }
}
