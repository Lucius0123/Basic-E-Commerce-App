import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/banner.dart';
import '../Model/category.dart';
import '../Model/product.dart';
import '../Screen/product_detail_Screen.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var categories = <Category>[].obs;
  var banners = <BannerModel>[].obs;
  var featuredProducts = <Product>[].obs;
  var bestsellerProducts = <Product>[].obs;
  var newArrivals = <Product>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadMockData();
  }

  void loadMockData() {
    isLoading.value = true;

    // Mock banners
    banners.value = [
      BannerModel(
        id: '1',
        title: 'Big Billion Days',
        subtitle: 'Up to 80% OFF',
        image: 'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=800&h=400&fit=crop',
        actionText: 'Shop Now',
        backgroundColor: const Color(0xFF1976D2),
        textColor: Colors.white,
      ),
      BannerModel(
        id: '2',
        title: 'Fashion Sale',
        subtitle: 'Trending Styles',
        image: 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=800&h=400&fit=crop',
        actionText: 'Explore',
        backgroundColor: const Color(0xFFE91E63),
        textColor: Colors.white,
      ),
      BannerModel(
        id: '3',
        title: 'Electronics Deal',
        subtitle: 'Latest Gadgets',
        image: 'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=800&h=400&fit=crop',
        actionText: 'Buy Now',
        backgroundColor: const Color(0xFF9C27B0),
        textColor: Colors.white,
      ),
    ];

    // Mock categories
    categories.value = [
      Category(
        id: '1',
        name: 'Electronics',
        image: 'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=200&h=200&fit=crop',
        icon: '📱',
        color: const Color(0xFF2196F3),
        gradientStart: const Color(0xFF2196F3),
        gradientEnd: const Color(0xFF21CBF3),
      ),
      Category(
        id: '2',
        name: 'Fashion',
        image: 'https://images.unsplash.com/photo-1445205170230-053b83016050?w=200&h=200&fit=crop',
        icon: '👗',
        color: const Color(0xFFE91E63),
        gradientStart: const Color(0xFFE91E63),
        gradientEnd: const Color(0xFFFF6B9D),
      ),
      Category(
        id: '3',
        name: 'Home & Living',
        image: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=200&h=200&fit=crop',
        icon: '🏠',
        color: const Color(0xFF4CAF50),
        gradientStart: const Color(0xFF4CAF50),
        gradientEnd: const Color(0xFF8BC34A),
      ),
      Category(
        id: '4',
        name: 'Beauty',
        image: 'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=200&h=200&fit=crop',
        icon: '💄',
        color: const Color(0xFFFF9800),
        gradientStart: const Color(0xFFFF9800),
        gradientEnd: const Color(0xFFFFB74D),
      ),
      Category(
        id: '5',
        name: 'Sports',
        image: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=200&h=200&fit=crop',
        icon: '⚽',
        color: const Color(0xFF9C27B0),
        gradientStart: const Color(0xFF9C27B0),
        gradientEnd: const Color(0xFFBA68C8),
      ),
      Category(
        id: '6',
        name: 'Books',
        image: 'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=200&h=200&fit=crop',
        icon: '📚',
        color: const Color(0xFF795548),
        gradientStart: const Color(0xFF795548),
        gradientEnd: const Color(0xFFA1887F),
      ),
    ];

    // Mock products
    products.value = [
      // Electronics
      Product(
        id: '1',
        name: 'iPhone 15 Pro Max',
        brand: 'Apple',
        image: 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop',
        images: [
          'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop',
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=400&fit=crop',
        ],
        price: 1199.99,
        originalPrice: 1299.99,
        category: 'Electronics',
        subCategory: 'Smartphones',
        rating: 4.8,
        reviewCount: 2847,
        description: 'Latest iPhone with A17 Pro chip and titanium design',
        features: ['A17 Pro Chip', '48MP Camera', '5G Ready', 'Face ID'],
        isBestseller: true,
        discountPercentage: 8,
        deliveryTime: 'Tomorrow',
      ),
      Product(
        id: '2',
        name: 'MacBook Air M2',
        brand: 'Apple',
        image: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400&h=400&fit=crop',
        images: [
          'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400&h=400&fit=crop',
        ],
        price: 999.99,
        originalPrice: 1199.99,
        category: 'Electronics',
        subCategory: 'Laptops',
        rating: 4.7,
        reviewCount: 1523,
        description: 'Supercharged by M2 chip for incredible performance',
        features: ['M2 Chip', '13.6" Display', '18hr Battery', 'Touch ID'],
        isNewArrival: true,
        discountPercentage: 17,
        deliveryTime: '2-3 days',
      ),

      // Fashion
      Product(
        id: '3',
        name: 'Premium Cotton T-Shirt',
        brand: 'Nike',
        image: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=400&fit=crop',
        images: [
          'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=400&fit=crop',
        ],
        price: 29.99,
        originalPrice: 49.99,
        category: 'Fashion',
        subCategory: 'Men\'s Clothing',
        rating: 4.5,
        reviewCount: 892,
        description: 'Comfortable premium cotton t-shirt for everyday wear',
        features: ['100% Cotton', 'Machine Washable', 'Regular Fit', 'Breathable'],
        discountPercentage: 40,
        deliveryTime: 'Tomorrow',
      ),
      Product(
        id: '4',
        name: 'Designer Handbag',
        brand: 'Michael Kors',
        image: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=400&fit=crop',
        images: [
          'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=400&fit=crop',
        ],
        price: 199.99,
        originalPrice: 299.99,
        category: 'Fashion',
        subCategory: 'Women\'s Accessories',
        rating: 4.6,
        reviewCount: 456,
        description: 'Elegant designer handbag perfect for any occasion',
        features: ['Genuine Leather', 'Multiple Compartments', 'Adjustable Strap', 'Designer Brand'],
        isBestseller: true,
        discountPercentage: 33,
        deliveryTime: '2-3 days',
      ),

      // Home & Living
      Product(
        id: '5',
        name: 'Smart LED TV 55"',
        brand: 'Samsung',
        image: 'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400&h=400&fit=crop',
        images: [
          'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400&h=400&fit=crop',
        ],
        price: 699.99,
        originalPrice: 899.99,
        category: 'Home & Living',
        subCategory: 'Electronics',
        rating: 4.4,
        reviewCount: 1234,
        description: '4K Ultra HD Smart TV with HDR and built-in streaming',
        features: ['4K Ultra HD', 'Smart TV', 'HDR Support', 'Voice Control'],
        discountPercentage: 22,
        deliveryTime: '3-5 days',
      ),

      // Beauty
      Product(
        id: '6',
        name: 'Luxury Skincare Set',
        brand: 'L\'Oréal',
        image: 'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=400&h=400&fit=crop',
        images: [
          'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=400&h=400&fit=crop',
        ],
        price: 89.99,
        originalPrice: 129.99,
        category: 'Beauty',
        subCategory: 'Skincare',
        rating: 4.7,
        reviewCount: 678,
        description: 'Complete skincare routine with premium ingredients',
        features: ['Anti-Aging', 'Hydrating', 'Dermatologist Tested', 'Natural Ingredients'],
        isNewArrival: true,
        discountPercentage: 31,
        deliveryTime: 'Tomorrow',
      ),

      // Sports
      Product(
        id: '7',
        name: 'Running Shoes',
        brand: 'Adidas',
        image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=400&fit=crop',
        images: [
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=400&fit=crop',
        ],
        price: 129.99,
        originalPrice: 179.99,
        category: 'Sports',
        subCategory: 'Footwear',
        rating: 4.6,
        reviewCount: 1567,
        description: 'Professional running shoes with advanced cushioning',
        features: ['Boost Technology', 'Breathable Mesh', 'Lightweight', 'Durable Sole'],
        isBestseller: true,
        discountPercentage: 28,
        deliveryTime: 'Tomorrow',
      ),

      // Books
      Product(
        id: '8',
        name: 'Bestselling Novel Collection',
        brand: 'Penguin',
        image: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=400&h=400&fit=crop',
        images: [
          'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=400&h=400&fit=crop',
        ],
        price: 24.99,
        originalPrice: 39.99,
        category: 'Books',
        subCategory: 'Fiction',
        rating: 4.8,
        reviewCount: 234,
        description: 'Collection of award-winning novels from top authors',
        features: ['Hardcover', 'Award Winners', 'Classic Literature', 'Gift Edition'],
        discountPercentage: 38,
        deliveryTime: '2-3 days',
      ),
    ];

    // Filter products for different sections
    featuredProducts.value = products.where((p) => p.rating >= 4.5).take(6).toList();
    bestsellerProducts.value = products.where((p) => p.isBestseller).toList();
    newArrivals.value = products.where((p) => p.isNewArrival).toList();

    isLoading.value = false;
  }

  void navigateToProductDetail(Product product) {
    Get.to(() => ProductDetailScreen(product: product));
  }
}

