import 'package:stylish_app/packages/packages.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HomeAppBar(),
          HomeSearchBar(),
          SizedBox(height: 16),
          CategorySection(),
          PromoBanner(),
          DealOfDay(),
          SizedBox(height: 16),
          SpecialOffers(),
          FlatHeelsBanner(),
          SizedBox(height: 16),
          TrendingProducts(),
          SizedBox(height: 16),
          NewArrivals(),
          SizedBox(height: 16),
          SponsoredBanner(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
