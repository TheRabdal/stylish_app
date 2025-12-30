import 'package:flutter/material.dart';

class PaymentMethodModel {
  final String name;
  final String iconAsset; // Simplified to string for asset path or dummy icon
  final IconData? iconData; // Fallback for dummy
  final String maskedNumber;
  bool isSelected;

  PaymentMethodModel({
    required this.name,
    this.iconAsset = '',
    this.iconData,
    required this.maskedNumber,
    this.isSelected = false,
  });
}

class ShippingSummaryModel {
  final double orderAmount;
  final double shippingFee;
  final double totalAmount;

  ShippingSummaryModel({
    required this.orderAmount,
    required this.shippingFee,
    required this.totalAmount,
  });
}
