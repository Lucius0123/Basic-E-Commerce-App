import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as badges;
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Controller/product_controller.dart';
import '../Theme/app_theme.dart';
import '../Widgets/banner_card.dart';
import '../Widgets/category_card.dart';
import '../Widgets/product_card.dart';
import '../Widgets/section_header.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductController productController = Get.find<ProductController>();
  int currentBannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        title: Text(
          'E-Commerce App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.cart_fill, color: Colors.white),
              onPressed: () {},
            ),

          ],

      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () async {
            productController.loadMockData();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
            Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for products, brands and more...',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 24,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                    IconButton(
                      icon: Icon(Icons.mic, color: Colors.grey.shade600),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.grey.shade600),
                      onPressed: () {},
                    ),
                  ],
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
                const SizedBox(height: 16),
                _buildBannerSlider(),
                const SizedBox(height: 20),
                _buildCategoriesSection(),
                const SizedBox(height: 24),
                _buildFeaturedProducts(),
                const SizedBox(height: 24),
                _buildBestsellerProducts(),
                const SizedBox(height: 24),
                _buildNewArrivals(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      }),
    );
  }



  Widget _buildBannerSlider() {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: productController.banners.length,
          options: CarouselOptions(
            height: 180,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                currentBannerIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final banner = productController.banners[index];
            return BannerCard(banner: banner);
          },
        ),
        const SizedBox(height: 12),
        AnimatedSmoothIndicator(
          activeIndex: currentBannerIndex,
          count: productController.banners.length,
          effect: WormEffect(
            dotColor: Colors.grey.shade300,
            activeDotColor: AppTheme.primaryColor,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Shop by Category',
          onViewAll: () {},
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: productController.categories.length,
            itemBuilder: (context, index) {
              final category = productController.categories[index];
              return CategoryCard(category: category);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedProducts() {
    return Column(
      children: [
        SectionHeader(
          title: 'Featured Products',
          subtitle: 'Handpicked for you',
          onViewAll: () {},
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: productController.featuredProducts.length,
            itemBuilder: (context, index) {
              final product = productController.featuredProducts[index];
              return Container(
                width: 180,
                margin: const EdgeInsets.only(right: 12),
                child: ProductCard(product: product),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBestsellerProducts() {
    return Column(
      children: [
        SectionHeader(
          title: 'Bestsellers',
          subtitle: 'Most popular items',
          onViewAll: () {},
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent:300,
              crossAxisCount: 2,
              childAspectRatio: 0.5,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: productController.bestsellerProducts.length,
            itemBuilder: (context, index) {
              final product = productController.bestsellerProducts[index];
              return ProductCard(product: product);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNewArrivals() {
    return Column(
      children: [
        SectionHeader(
          title: 'New Arrivals',
          subtitle: 'Fresh & trending',
          onViewAll: () {},
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: productController.newArrivals.length,
            itemBuilder: (context, index) {
              final product = productController.newArrivals[index];
              return Container(
                width: 180,
                margin: const EdgeInsets.only(right: 12),
                child: ProductCard(product: product),
              );
            },
          ),
        ),
      ],
    );
  }
}
