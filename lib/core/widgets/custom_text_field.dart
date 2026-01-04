import 'package:stylish_app/packages/packages.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData? icon;
  final bool isPassword;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool passwordHash;
  final FontWeight? fontWeight;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool autofocus;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField({
    super.key,
    required this.hint,
    this.icon,
    this.isPassword = false,
    this.controller,
    this.suffixIcon,
    this.passwordHash = false,
    this.fontWeight,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: passwordHash,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      autofocus: autofocus,
      style: GoogleFonts.montserrat(
        color: Colors.black,
        fontWeight: fontWeight,
      ),
      decoration: InputDecoration(
        prefixIcon: icon == null ? null : Icon(icon, color: Colors.grey[600]),
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: GoogleFonts.montserrat(color: Colors.grey[500]),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFF83758)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
