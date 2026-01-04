import 'package:stylish_app/packages/packages.dart';

class CartItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final String variations;
  final String size;
  final String qty;
  final String deliveryDate;
  final double price;
  final double oldPrice;
  final String discount;
  final Function(String) onSizeChanged;
  final Function(int) onQtyChanged;

  const CartItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.variations,
    required this.size,
    required this.qty,
    required this.deliveryDate,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.onSizeChanged,
    required this.onQtyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: 100,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 100,
                  height: 120,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    variations,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final selectedSize = await showDialog<String>(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: const Text("Select Size"),
                              children:
                                  ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK']
                                      .map(
                                        (s) => SimpleDialogOption(
                                          onPressed: () =>
                                              Navigator.pop(context, s),
                                          child: Text(s),
                                        ),
                                      )
                                      .toList(),
                            ),
                          );
                          if (selectedSize != null) {
                            onSizeChanged(selectedSize);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Size $size",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down, size: 16),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () async {
                          final selectedQty = await showDialog<int>(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: const Text("Select Quantity"),
                              children: List.generate(100, (index) => index + 1)
                                  .map(
                                    (q) => SimpleDialogOption(
                                      onPressed: () =>
                                          Navigator.pop(context, q),
                                      child: Text(q.toString()),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                          if (selectedQty != null) {
                            onQtyChanged(selectedQty);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Qty $qty",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down, size: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        const TextSpan(text: "Delivery by "),
                        TextSpan(
                          text: deliveryDate,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
