import 'dart:async';
import 'package:stylish_app/packages/packages.dart';

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

  @override
  void dispose() {
    _timer.cancel();
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
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              ProductCard(
                image:
                    'https://plus.unsplash.com/premium_photo-1664202526559-e21e9c0fb46a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                name: "Women Printed Kurta",
                description: "Neque porro quisquam est qui dolorem ipsum...",
                price: "₹1500",
                oldPrice: "₹2499",
                discount: "40%Off",
                rating: 4,
                reviewCount: 56090,
              ),
              SizedBox(width: 16),
              ProductCard(
                image:
                    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                name: "HRX by Hrithik Roshan",
                description: "Neque porro quisquam est qui dolorem ipsum...",
                price: "₹2499",
                oldPrice: "₹4999",
                discount: "50%Off",
                rating: 4,
                reviewCount: 344567,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
