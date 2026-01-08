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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        SystemNavigator.pop();
      },
      child: const Scaffold(
        body: Stack(
          children: [
            GetStartedBackground(), 
            GetStartedContent()
          ]
        ),
      ),
    );
  }
}
