import 'package:flutter/material.dart';
import 'package:mendomarket/data/product_data.dart';
import 'package:mendomarket/features/home/home_banner.dart';
import 'package:mendomarket/features/home/home_categories.dart';
import 'package:mendomarket/features/home/home_products.dart';
import 'package:mendomarket/features/home/home_search_bar.dart';
import 'package:mendomarket/widgets/common/custom_app_bar.dart';
import 'package:mendomarket/widgets/common/custom_nav_bar.dart';
import 'package:mendomarket/features/search/search_page.dart';
import 'package:mendomarket/models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int selectedFilter = 0;
  final filters = ['Todo', 'Recientes', 'Destacado'];
  final TextEditingController _searchController = TextEditingController();

  Set<String> favoriteProductIds = {};

  List<Product> getFilteredProducts() {
    switch (selectedFilter) {
      case 1:
        return newArrivalsProducts;
      case 2:
        return featuredProducts;
      default:
        return allProducts;
    }
  }

  void _toggleFavorite(Product product) {
    setState(() {
      if (favoriteProductIds.contains(product.id)) {
        favoriteProductIds.remove(product.id);
      } else {
        favoriteProductIds.add(product.id);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSearchSubmittedFromHome() {
    final searchText = _searchController.text;
    if (searchText.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchPage(initialSearchQuery: searchText),
        ),
      );
      _searchController.clear();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = getFilteredProducts();

    return Scaffold(
      appBar: CustomAppBar(
        title: "MendoMarket",
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          HomeSearchBar(
            controller: _searchController,
            onSearchSubmitted: (value) => _onSearchSubmittedFromHome(),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeBanner(),
                  const HomeCategories(),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: List.generate(filters.length, (index) {
                        final isSelected = selectedFilter == index;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFilter = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFE9C46A)
                                    : const Color(0xFFF9F4ED),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: isSelected
                                    ? [
                                        const BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 4,
                                        ),
                                      ]
                                    : [],
                              ),
                              child: Text(
                                filters[index],
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 10),
                  HomeProducts(
                    title: filters[selectedFilter],
                    products: filteredProducts,
                    favoriteProductIds: favoriteProductIds,
                    onFavoriteToggle: _toggleFavorite,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}