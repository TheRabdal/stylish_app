import 'package:stylish_app/packages/packages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String route = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page"), centerTitle: true),
      body: const Center(child: Text("Welcome to Home Page")),
    );
  }
}
