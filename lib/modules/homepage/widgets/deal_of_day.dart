import 'package:stylish_app/packages/packages.dart';
import 'package:stylish_app/core/widgets/widgets.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  late Timer _timer;
  Duration _timeRemaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateTimeRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTimeRemaining();
    });
  }

  void _updateTimeRemaining() {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day + 1);
    setState(() {
      _timeRemaining = midnight.difference(now);
    });
  }

  final ScrollController _scrollController = ScrollController();

  void _scrollRight() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.offset + 200,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${hours}h ${minutes}m ${seconds}s remaining';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ... (keep existing header code)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF4392F9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deal of the Day",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatDuration(_timeRemaining),
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "View all",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Stack(
          children: [
            SizedBox(
              height: 250,
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  ProductCard(
                    image: 'assets/womenprintedkurta.png',
                    name: "Women Printed Kurta",
                    description:
                        "Neque porro quisquam est qui dolorem ipsum quia",
                    price: "₹1500",
                    oldPrice: "₹2499",
                    discount: "40%Off",
                    rating: 4,
                    reviewCount: 56890,
                  ),
                  SizedBox(width: 16),
                  ProductCard(
                    image: 'assets/hrx.png',
                    name: "HRX by Hrithik Roshan",
                    description:
                        "Neque porro quisquam est qui dolorem ipsum quia",
                    price: "₹2499",
                    oldPrice: "₹4999",
                    discount: "50%Off",
                    rating: 4,
                    reviewCount: 344567,
                  ),
                  SizedBox(width: 16),
                  ProductCard(
                    image: 'assets/philips.png',
                    name: "Philips BHH880/10",
                    description:
                        "Hair Straightening Brush With Keratin Infused Bristles (Black).",
                    price: "₹999",
                    oldPrice: "₹1999",
                    discount: "50%Off",
                    rating: 4,
                    reviewCount: 646776,
                  ),
                  SizedBox(width: 16),
                  ProductCard(
                    image: 'assets/titan.png',
                    name: "TITAN Men Watch- 1806N",
                    description:
                        "This Titan watch in Black color is I wanted to buy for a long time",
                    price: "₹1500",
                    oldPrice: "₹3500",
                    discount: "60%Off",
                    rating: 5,
                    reviewCount: 15007,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 8,
              top: 0,
              bottom: 0,
              child: Center(child: ArrowButton(onTap: _scrollRight)),
            ),
          ],
        ),
      ],
    );
  }
}
