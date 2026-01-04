import 'package:stylish_app/packages/packages.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onChanged;
  final bool autofocus;

  const HomeSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: SizedBox(
          width: 343,
          height: 40,
          child: CustomTextField(
            controller: controller,
            onChanged: (_) => onChanged?.call(),
            autofocus: autofocus,
            hint: "Search any Product..",
            icon: Icons.search,
            suffixIcon: const Icon(Icons.mic, color: Colors.grey),
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
