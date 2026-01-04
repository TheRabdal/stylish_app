import 'package:stylish_app/packages/packages.dart';

class FilterResult {
  final RangeValues priceRange;
  final String category;
  final String size;
  final Color color;

  FilterResult({
    required this.priceRange,
    required this.category,
    required this.size,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'priceRange': priceRange,
      'category': category,
      'size': size,
      'color': color,
    };
  }

  factory FilterResult.fromMap(Map<String, dynamic> map) {
    return FilterResult(
      priceRange: map['priceRange'] as RangeValues,
      category: map['category'] as String,
      size: map['size'] as String,
      color: map['color'] as Color,
    );
  }

  FilterResult copyWith({
    RangeValues? priceRange,
    String? category,
    String? size,
    Color? color,
  }) {
    return FilterResult(
      priceRange: priceRange ?? this.priceRange,
      category: category ?? this.category,
      size: size ?? this.size,
      color: color ?? this.color,
    );
  }
}
