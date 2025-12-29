import 'package:stylish_app/packages/packages.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  static const String route = 'GetStartedPage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [GetStartedBackground(), GetStartedContent()]),
    );
  }
}
