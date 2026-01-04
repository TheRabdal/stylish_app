import 'package:stylish_app/packages/packages.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0, 
        vertical: 20
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.menu_outlined, color: Colors.black),
          ),
          Row(
            children: [
              // Logo
              Image.asset(
                'assets/images/logo.png',
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 8),
              Text(
                "Stylish",
                style: GoogleFonts.montserrat(
                  color: const Color(0xFF4392F9),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile_logo.png'),
            radius: 20,
          ),
        ],
      ),
    );
  }
}
