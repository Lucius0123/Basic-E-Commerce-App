import 'dart:ui';

class Category {
  final String id;
  final String name;
  final String image;
  final String icon;
  final Color color;
  final Color gradientStart;
  final Color gradientEnd;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.icon,
    required this.color,
    required this.gradientStart,
    required this.gradientEnd,
  });
}
