import 'package:stylish_app/packages/packages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(child: HomeContent()),
    );
  }
}
