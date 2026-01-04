import 'package:stylish_app/packages/packages.dart';

class FlatHeelsBanner extends StatelessWidget {
  const FlatHeelsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        width: double.infinity,
        height: 172,
        decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
        child: Stack(
          children: [
            Positioned(
              left: 5,
              top: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/flatandheels3.png',
                width: 11,
                height: 171,
                fit: BoxFit.cover,
              ),
            ),
            // Yellow dots pattern effect (flatandheels2.png)
            Positioned(
              left: 10,
              child: Image.asset(
                'assets/images/flatandheels2.png',
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
            // Heels image (flatandheels.png)
            Positioned(
              left: 20,
              top: 20,
              bottom: 20,
              child: Image.asset(
                'assets/images/flatandheels.png',
                width: 160,
                fit: BoxFit.contain,
              ),
            ),
            // Text content on the right
            Positioned(
              right: 15,
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Flat and Heels",
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "Stand a chance to get rewarded",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      // Find Red High Heels product
                      final redHeelsProduct = allProducts.firstWhere(
                        (product) => product.name == "Red High Heels",
                        orElse: () => allProducts[0],
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: redHeelsProduct),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF83758),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 10,
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Visit now",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.arrow_forward, size: 16),
                      ],
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
}
