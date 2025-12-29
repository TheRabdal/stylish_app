import 'package:stylish_app/packages/packages.dart';

class GetStartedContent extends StatelessWidget {
  const GetStartedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/reactangle.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "You want \nAuthentic, here \nyou go!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Find it here, buy it now!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFFF2F2F2),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 40),
                Button(
                  text: "Get Started",
                  onPressed: () {
                    // Navigate to Home or relevant page
                    debugPrint("Get Started Pressed");
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
