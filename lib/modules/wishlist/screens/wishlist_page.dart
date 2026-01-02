import 'package:stylish_app/packages/packages.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  // Dummy data matching the reference image text exactly
  final List<Product> products = const [
    Product(
      image: "assets/images/blackwinter.png",
      name: "Black Winter...",
      description: "Autumn And Winter Casual cotton-padded jacket...",
      price: "₹499",
      oldPrice: "₹999",
      discount: "50% OFF",
      rating: 4,
      reviewCount: 6890,
      height: 200.0,
    ),
    Product(
      image: "assets/images/mansstarry.png",
      name: "Mens Starry",
      description: "Mens Starry Sky Printed Shirt 100% Cotton Fabric",
      price: "₹399",
      oldPrice: "₹799",
      discount: "50% OFF",
      rating: 4,
      reviewCount: 152344,
      height: 240.0,
    ),
    Product(
      image: "assets/images/blackdress.png",
      name: "Black Dress",
      description: "Solid Black Dress for Women, Sexy Chain Shorts Ladi...",
      price: "₹2,000",
      oldPrice: "₹4,000",
      discount: "50% OFF",
      rating: 5,
      reviewCount: 523456,
      height: 260.0,
    ),
    Product(
      image: "assets/images/pinkembroid.png",
      name: "Pink Ambroide...",
      description: "EARTHEN Rose Pink Embroidered Tiered Max...",
      price: "₹1,900",
      oldPrice: "₹3,800",
      discount: "50% OFF",
      rating: 4,
      reviewCount: 45678,
      height: 220.0,
    ),
    Product(
      image: "assets/images/flaredress.png",
      name: "Flare Dress",
      description: "Antheaa Black & Rust Orange Floral Print Tiered Midi F...",
      price: "₹1,990",
      oldPrice: "₹3,980",
      discount: "50% OFF",
      rating: 3,
      reviewCount: 335566,
      height: 240.0,
    ),
    Product(
      image: "assets/images/denimdress.png",
      name: "denim dress",
      description: "Blue cotton denim dress Look 2 Printed cotton dr...",
      price: "₹999",
      oldPrice: "₹1,999",
      discount: "50% OFF",
      rating: 4,
      reviewCount: 21344,
      height: 210.0,
    ),
    Product(
      image: "assets/images/jordanstay.png",
      name: "Jordan Stay",
      description: "The classic Air Jordan 12 to create a shoe that's fres...",
      price: "₹4,999",
      oldPrice: "₹9,999",
      discount: "50% OFF",
      rating: 5,
      reviewCount: 1023456,
      height: 180.0,
    ),
    Product(
      image: "assets/images/realme7.png",
      name: "Realme 7",
      description: "6 GB RAM | 64 GB ROM | Expandable Upto 256...",
      price: "₹3,499",
      oldPrice: "₹6,999",
      discount: "50% OFF",
      rating: 4,
      reviewCount: 344567,
      height: 190.0,
    ),
    Product(
      image: "assets/images/ps4.png",
      name: "Sony PS4",
      description: "Sony PS4 Console, 1TB Slim with 3 Games: Gran Turis...",
      price: "₹1,999",
      oldPrice: "₹3,999",
      discount: "50% OFF",
      rating: 4,
      reviewCount: 852966,
      height: 200.0,
    ),
    Product(
      image: "assets/images/blackjacket.png",
      name: "Black Jacket 12...",
      description: "This warm and comfortable jacket is great for learni...",
      price: "₹2,999",
      oldPrice: "₹5,999",
      discount: "50% OFF",
      rating: 4,
      reviewCount: 234567,
      height: 230.0,
    ),
    Product(
      image: "assets/images/nikon.png",
      name: "D7200 Digital C...",
      description: "D7200 Digital Camera (Nikon) In New Area...",
      price: "₹26,999",
      oldPrice: "₹53,998",
      discount: "50% OFF",
      rating: 5,
      reviewCount: 67456,
      height: 190.0,
    ),
    Product(
      image: "assets/images/sepatufantopel.png",
      name: "men's & boys s...",
      description: "George Walker Derby Brown Formal Shoes",
      price: "₹999",
      oldPrice: "₹1,999",
      discount: "50% OFF",
      rating: 3,
      reviewCount: 1345678,
      height: 210.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF9F9F9,
      ), // Light background like in image
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            const HomeSearchBar(),
            const WishlistHeader(),
            WishlistGrid(products: products),
          ],
        ),
      ),
    );
  }
}
