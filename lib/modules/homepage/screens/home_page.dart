import 'package:stylish_app/packages/packages.dart';
import 'package:stylish_app/modules/homepage/screens/home_content.dart';

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
      backgroundColor: Colors.white,
      body: SafeArea(child: HomeContent()),
    );
  }
}
