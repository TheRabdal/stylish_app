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
      child: AppSearchBar(
        controller: controller,
        onChanged: onChanged,
        autofocus: autofocus,
      ),
    );
  }
}
