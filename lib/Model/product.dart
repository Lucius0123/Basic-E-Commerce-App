class Product {
  final String id;
  final String name;
  final String brand;
  final String image;
  final List<String> images;
  final double price;
  final double originalPrice;
  final String category;
  final String subCategory;
  final double rating;
  final int reviewCount;
  final String description;
  final List<String> features;
  final bool isBestseller;
  final bool isNewArrival;
  final int discountPercentage;
  final bool isFreeDelivery;
  final String deliveryTime;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.image,
    required this.images,
    required this.price,
    required this.originalPrice,
    required this.category,
    required this.subCategory,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.features,
    this.isBestseller = false,
    this.isNewArrival = false,
    required this.discountPercentage,
    this.isFreeDelivery = true,
    required this.deliveryTime,
  });

  double get discountAmount => originalPrice - price;
}
