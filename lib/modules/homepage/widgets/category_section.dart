import 'package:stylish_app/packages/packages.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  final List<Map<String, String>> categories = const [
    {'name': 'Beauty', 'image': 'assets/images/Beauty.png'},
    {'name': 'Fashion', 'image': 'assets/images/Fashion.png'},
    {'name': 'Kids', 'image': 'assets/images/Kids.png'},
    {'name': 'Mens', 'image': 'assets/images/Mens.png'},
    {'name': 'Womens', 'image': 'assets/images/Womens.png'},
    {'name': 'Gifts', 'image': 'assets/images/Gifts.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
}
