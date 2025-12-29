import 'package:stylish_app/packages/packages.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 60, bottom: 40),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Welcome\nBack!",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
