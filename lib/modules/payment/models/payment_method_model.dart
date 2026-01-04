class PaymentMethodModel {
  final String id;
  final String name;
  final String accountNumber;
  final String assetPath;
  final dynamic fallbackIcon;

  const PaymentMethodModel({
    required this.id,
    required this.name,
    required this.accountNumber,
    required this.assetPath,
    required this.fallbackIcon,
  });
}
