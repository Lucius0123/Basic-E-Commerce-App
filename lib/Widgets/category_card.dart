import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/category.dart';


class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.snackbar(
          'Category',
          'Selected ${category.name}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: category.color,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
          borderRadius: 8,
        );
      },
      child: Container(
        width: 90,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    category.gradientStart,
                    category.gradientEnd,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: category.color.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Background pattern
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        category.image,
                        fit: BoxFit.cover,
                        opacity: const AlwaysStoppedAnimation(0.3),
                        errorBuilder: (context, error, stackTrace) {
                          return Container();
                        },
                      ),
                    ),
                  ),
                  // Icon
                  Center(
                    child: Text(
                      category.icon,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
