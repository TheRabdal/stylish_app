import 'package:stylish_app/packages/packages.dart';
import 'package:stylish_app/modules/product_detail/screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //const ProductDetailScreen(), 
      initialRoute: SplashPage.route,
      routes: appRoutes,
    );
  }
}
