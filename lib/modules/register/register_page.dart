import 'package:stylish_app/packages/packages.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create an\naccount",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 36),
              const CustomTextField(
                hint: "Username or Email",
                icon: Icons.person,
              ),
              const SizedBox(height: 32),
              const CustomTextField(
                hint: "Password",
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 32),
              const CustomTextField(
                hint: "Confirm Password",
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              const Text(
                "By clicking the Register button, you agree\nto the public offer",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 38),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF83758),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Reusing SocialLogin widget logic manually or reusing widget if compatible
              // Since SocialLogin in login module has "OR Continue with", we can reuse it or copy structures.
              // Let's reuse SocialLogin from login widgets as it matches the design requirements roughly,
              // but looking at valid image, the footer "I Already Have an Account Login" is different from login page footer.
              // So I will construct it here.
              const SizedBox(height: 50),
              const Center(child: Text("- OR Continue with -")),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    onTap: () {},
                    icon: Image.asset(
                      'assets/Google.png'),
                  ),
                  const SizedBox(width: 10),
                  SocialButton(
                    onTap: () {},
                    icon: Image.asset(
                      'assets/Apple.png'),
                  ),
                  const SizedBox(width: 10),
                  SocialButton(
                    onTap: () {},
                    icon: Image.asset(
                      'assets/Facebook.png'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "I Already Have an Account ",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFF83758),
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
