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
              right: 20,
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Flat and Heels",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Stand a chance to get rewarded",
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF83758),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Visit now",
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
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
