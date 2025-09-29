import 'package:flutter/material.dart';
import 'package:grabber_grocery_app/core/utils/app_color.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ValueNotifier<int> _selectedTabIndex = ValueNotifier<int>(0);
  final ValueNotifier<int> _basketItemsCount = ValueNotifier<int>(0);

  final List<_Category> _categories = const [
    _Category('Fruits', Icons.local_grocery_store_outlined),
    _Category('Milk & egg', Icons.egg_alt_outlined),
    _Category('Beverages', Icons.local_cafe_outlined),
    _Category('Laundry', Icons.local_laundry_service_outlined),
    _Category('Vegetables', Icons.eco_outlined),
  ];

  final List<_Product> _fruits = const [
    _Product(
      name: 'Banana',
      price: 3.99,
      imageUrl:
          'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=800&q=80',
      rating: 4.8,
      reviews: 287,
    ),
    _Product(
      name: 'Pepper',
      price: 2.99,
      imageUrl:
          'https://images.unsplash.com/photo-1546549039-49c7c1dba1a9?w=800&q=80',
      rating: 4.8,
      reviews: 287,
    ),
    _Product(
      name: 'Orange',
      price: 3.99,
      imageUrl:
          'https://images.unsplash.com/photo-1490885578174-acda8905c2c6?w=800&q=80',
      rating: 4.7,
      reviews: 201,
    ),
  ];

  void _addToBasket() {
    _basketItemsCount.value = _basketItemsCount.value + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PromoBanner(onShopNow: () {}),
            const SizedBox(height: 16),
            _CategoriesRow(categories: _categories),
            const SizedBox(height: 8),
            _SectionHeader(
              title: 'Fruits',
              actionText: 'See all',
              onActionTap: () {},
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 210,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _fruits.length,
                padding: const EdgeInsets.only(right: 8),
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final product = _fruits[index];
                  return _ProductCard(product: product, onAdd: _addToBasket);
                },
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ValueListenableBuilder<int>(
            valueListenable: _basketItemsCount,
            builder: (context, count, _) => count > 0
                ? _ViewBasketBar(itemCount: count, onTap: () {})
                : const SizedBox.shrink(),
          ),
          ValueListenableBuilder<int>(
            valueListenable: _selectedTabIndex,
            builder: (context, idx, _) => _BottomBar(
              currentIndex: idx,
              onTap: (i) => _selectedTabIndex.value = i,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 36,
      leading: const Padding(
        padding: EdgeInsets.only(left: 12),
        child: Icon(Icons.pedal_bike, color: AppColors.black),
      ),
      title: Row(
        children: const [
          Expanded(
            child: Text(
              '61 Hopper street..',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: AppColors.black),
        ],
      ),
      centerTitle: false,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.shopping_bag_outlined, color: AppColors.black),
        ),
      ],
    );
  }
}

class _PromoBanner extends StatelessWidget {
  final VoidCallback onShopNow;
  const _PromoBanner({required this.onShopNow});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F9ED),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 160,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFD9F3E0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.local_grocery_store,
                color: AppColors.main,
                size: 64,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Up to 30% offer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Enjoy our big offer',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 36,
                  child: ElevatedButton(
                    onPressed: onShopNow,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.main,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: const Text(
                      'Shop Now',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoriesRow extends StatelessWidget {
  final List<_Category> categories;
  const _CategoriesRow({required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final cat = categories[index];
          return Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Icon(cat.icon, color: AppColors.main),
              ),
              const SizedBox(height: 6),
              Text(
                cat.label,
                style: const TextStyle(fontSize: 12, color: Colors.black87),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final _Product product;
  final VoidCallback onAdd;
  const _ProductCard({required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xFFFFB800), size: 16),
                const SizedBox(width: 4),
                Text(
                  '${product.rating} (${product.reviews})',
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: onAdd,
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: AppColors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const _BottomBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.main,
      unselectedItemColor: Colors.black54,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
      ],
    );
  }
}

class _ViewBasketBar extends StatelessWidget {
  final int itemCount;
  final VoidCallback onTap;
  const _ViewBasketBar({required this.itemCount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            const Icon(Icons.shopping_basket_outlined, color: Colors.white),
            const SizedBox(width: 8),
            const Text(
              'View Basket',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            _Badge(count: itemCount),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final int count;
  const _Badge({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        '$count',
        style: const TextStyle(
          color: AppColors.main,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onActionTap;
  const _SectionHeader({
    required this.title,
    required this.actionText,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onActionTap,
          child: Text(
            actionText,
            style: const TextStyle(
              color: AppColors.main,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _Category {
  final String label;
  final IconData icon;
  const _Category(this.label, this.icon);
}

class _Product {
  final String name;
  final double price;
  final String imageUrl;
  final double rating;
  final int reviews;

  const _Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
  });
}
