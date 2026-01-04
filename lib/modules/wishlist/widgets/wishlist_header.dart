import 'package:stylish_app/packages/packages.dart';

class WishlistHeader extends StatelessWidget {
  final VoidCallback? onSortTap;
  final VoidCallback? onFilterTap;
  final TextEditingController? searchController;
  final VoidCallback? onSearchChanged;

  const WishlistHeader({
    super.key,
    this.onSortTap,
    this.onFilterTap,
    this.searchController,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: AppSearchBar(
            controller: searchController,
            onChanged: onSearchChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListenableBuilder(
                listenable: WishlistService(),
                builder: (context, child) {
                  return Text(
                    "${WishlistService().items.length} Items",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  );
                },
              ),
              Row(
                children: [
                  _buildActionButton("Sort", Icons.swap_vert, onSortTap),
                  const SizedBox(width: 8),
                  _buildActionButton(
                    "Filter",
                    Icons.filter_alt_outlined,
                    onFilterTap,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            Icon(icon, size: 16, color: const Color(0xFF575757)),
          ],
        ),
      ),
    );
  }
}
