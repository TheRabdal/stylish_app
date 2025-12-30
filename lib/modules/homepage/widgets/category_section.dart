import 'package:stylish_app/packages/packages.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  final List<Map<String, String>> categories = const [
    {'name': 'Beauty', 'image': 'assets/Beauty.png'},
    {'name': 'Fashion', 'image': 'assets/Fashion.png'},
    {'name': 'Kids', 'image': 'assets/Kids.png'},
    {'name': 'Mens', 'image': 'assets/Mens.png'},
    {'name': 'Womens', 'image': 'assets/Womens.png'},
    {'name': 'Gifts', 'image': 'assets/Gifts.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  _buildActionButton("Sort", Icons.import_export),
                  const SizedBox(width: 8),
                  _buildActionButton("Filter", Icons.filter_alt_outlined),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(categories[index]['image']!),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    categories[index]['name']!,
                    style: GoogleFonts.montserrat(fontSize: 12),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(label, style: GoogleFonts.montserrat(fontSize: 12)),
          const SizedBox(width: 4),
          Icon(icon, size: 16),
        ],
      ),
    );
  }
}
