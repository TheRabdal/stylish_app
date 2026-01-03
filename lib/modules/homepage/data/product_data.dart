import 'package:stylish_app/modules/homepage/models/product_model.dart';

// Data from Trending Products and Search Page
const List<Product> trendingProductsList = [
  Product(
    image: 'assets/images/watch.png',
    name: "IWC Schaffhausen",
    description: "2021 Pilot's Watch \"SIHH 2019\" 44mm",
    price: "₹650",
    oldPrice: "₹1599",
    discount: "60% off",
    rating: 5,
    reviewCount: 650,
  ),
  Product(
    image: 'assets/images/whiteshoes.png',
    name: "Labbin White Sneakers",
    description: "For Men and Female",
    price: "₹650",
    oldPrice: "₹1250",
    discount: "70% off",
    rating: 4,
    reviewCount: 650,
  ),
  Product(
    image: 'assets/images/womenshandback.png',
    name: "Mammon Women's Handbag",
    description: "(Set of 3, Beige)",
    price: "₹750",
    oldPrice: "₹1999",
    discount: "60% off",
    rating: 4,
    reviewCount: 750,
  ),
  Product(
    image: 'assets/images/sandalcoklat.png',
    name: "Do Bhai Women Wedges Sandal",
    description: "(Butterfly)",
    price: "₹750",
    oldPrice: "₹1499",
    discount: "50% off",
    rating: 4,
    reviewCount: 750,
  ),
  Product(
    image: 'assets/images/lipstik.png',
    name: "Lakme Enrich Matte Lipstick",
    description: "Shade RM1(4.7gm)",
    price: "₹950",
    oldPrice: "₹1990",
    discount: "60% off",
    rating: 4,
    reviewCount: 950,
  ),
  Product(
    image: 'assets/images/jordan.png',
    name: "Nike Air Jordan",
    description: "Nike Air Jordan 1 Retro High OG",
    price: "₹1250",
    oldPrice: "₹2500",
    discount: "50% off",
    rating: 5,
    reviewCount: 120,
  ),
];

// Data from Deal Of Day
const List<Product> dealOfDayProductsList = [
  Product(
    image: 'assets/images/womenprintedkurta.png',
    name: "Women Printed Kurta",
    description: "Neque porro quisquam est qui dolorem ipsum quia",
    price: "₹1500",
    oldPrice: "₹2499",
    discount: "40%Off",
    rating: 4,
    reviewCount: 56890,
  ),
  Product(
    image: 'assets/images/hrx.png',
    name: "HRX by Hrithik Roshan",
    description: "Neque porro quisquam est qui dolorem ipsum quia",
    price: "₹2499",
    oldPrice: "₹4999",
    discount: "50%Off",
    rating: 4,
    reviewCount: 344567,
  ),
  Product(
    image: 'assets/images/philips.png',
    name: "Philips BHH880/10",
    description:
        "Hair Straightening Brush With Keratin Infused Bristles (Black).",
    price: "₹999",
    oldPrice: "₹1999",
    discount: "50%Off",
    rating: 4,
    reviewCount: 646776,
  ),
  Product(
    image: 'assets/images/titan.png',
    name: "TITAN Men Watch- 1806N",
    description:
        "This Titan watch in Black color is I wanted to buy for a long time",
    price: "₹1500",
    oldPrice: "₹3500",
    discount: "60%Off",
    rating: 5,
    reviewCount: 15007,
  ),
];

final List<Product> allProducts = [
  ...trendingProductsList,
  ...dealOfDayProductsList,
];
