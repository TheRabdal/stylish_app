class PaymentMethodModel {
  final String id;
  final String name;
  final String accountNumber; // Masked number ideally
  final String assetPath;
  final dynamic
  fallbackIcon; // Using dynamic or IconData to avoid external dependencies issues here, or importing material

  const PaymentMethodModel({
    required this.id,
    required this.name,
    required this.accountNumber,
    required this.assetPath,
    required this.fallbackIcon,
  });
}
