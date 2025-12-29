import 'package:stylish_app/packages/packages.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  static const String route = 'GetStartedPage';

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [GetStartedBackground(), GetStartedContent()]),
    );
  }
}
