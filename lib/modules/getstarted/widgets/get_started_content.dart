import 'package:stylish_app/packages/packages.dart';

class GetStartedContent extends StatelessWidget {
  const GetStartedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 362,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/shapetransparant.png'),
            fit: BoxFit.fill,
          ),
        ),
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
                  fontWeight: FontWeight.w600,
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
                width: 279,
                height: 55,
                onPressed: () async {
                  await SharedPreference.setHasSeenGetStarted(true);
                  if (!context.mounted) return;
                  Navigator.pushNamed(context, NavigationPage.route);
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
