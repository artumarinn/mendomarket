import 'package:flutter/material.dart';
import 'package:mendomarket/data/product_data.dart';
import 'package:mendomarket/models/product.dart';
import 'package:mendomarket/widgets/common/custom_app_bar.dart';
import 'package:mendomarket/widgets/common/custom_nav_bar.dart';
import 'package:mendomarket/features/home/home_products.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int _selectedIndex = 3;
  Set<String> favoriteProductIds = {}; 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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

  @override
  Widget build(BuildContext context) {
    final favoriteProducts = allProducts.where((p) => favoriteProductIds.contains(p.id)).toList();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Favoritos',
        centerTitle: true,
      ),
      body: HomeProducts(
        title: 'Favoritos',
        products: favoriteProducts,
        favoriteProductIds: favoriteProductIds,
        onFavoriteToggle: _toggleFavorite,
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}