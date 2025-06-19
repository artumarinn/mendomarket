import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';
import 'package:mendomarket/widgets/common/product_card.dart';
import 'package:mendomarket/widgets/common/products_tags.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  final List<Map<String, String>> products = const [
    {
      "title": "Impresión 3D",
      "price": "6000",
      "location": "Luján de Cuyo, Mendoza",
      "image": "assets/images/products/product3d.png",
    },
    {
      "title": "Gorra personalizada",
      "price": "5000",
      "location": "Godoy Cruz, Mendoza",
      "image": "assets/images/products/gorra.png",
    },
    {
      "title": "Taza Sublimada",
      "price": "3500",
      "location": "Maipú, Mendoza",
      "image": "assets/images/products/tazaSublimada.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Título
        Container(
          width: double.infinity,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 16, bottom: 10, top: 10),
          child: Text(
            "Productos",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        // Filtros
        const ProductsTags(),

        // Productos con scroll
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: products
                .map((product) => ProductCard(
                      title: product['title']!,
                      price: product['price']!,
                      location: product['location']!,
                      image: product['image']!,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
