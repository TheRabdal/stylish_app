import 'package:stylish_app/packages/packages.dart';

class HomeHeaderSection extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onSortPressed;
  final VoidCallback onFilterPressed;

  const HomeHeaderSection({
    super.key,
    required this.searchController,
    required this.onSortPressed,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeAppBar(),
        HomeSearchBar(controller: searchController),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "All Featured",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  HomeActionButton(
                    label: "Sort",
                    icon: Icons.swap_vert,
                    onTap: onSortPressed,
                  ),
                  const SizedBox(width: 8),
                  HomeActionButton(
                    label: "Filter",
                    icon: Icons.filter_alt_outlined,
                    onTap: onFilterPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
