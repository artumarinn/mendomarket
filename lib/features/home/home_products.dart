import 'package:flutter/material.dart';
import 'package:mendomarket/models/product.dart';
import 'package:mendomarket/widgets/common/product_card.dart';

class HomeProducts extends StatelessWidget {
  final String title;
  final List<Product> products;
  final Set<String> favoriteProductIds;
  final Function(Product) onFavoriteToggle;

  const HomeProducts({
    super.key,
    required this.title,
    required this.products,
    required this.favoriteProductIds,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(child: Text('No hay productos para mostrar'));
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.67,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
          isFavorite: favoriteProductIds.contains(product.id),
          onFavoriteToggle: () => onFavoriteToggle(product),
        );
      },
    );
  }
}