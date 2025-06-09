import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';
import 'package:mendomarket/widgets/common/category_item.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 16, bottom: 10),
            child: Text(
              "Cateogorias",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CategoryItem(icon: Icons.shopping_bag, label: 'Ropa'),
              CategoryItem(icon: Icons.print, label: 'Papeleria'),
              CategoryItem(icon: Icons.print, label: '3D'),
              CategoryItem(icon: Icons.add, label: 'Más')
            ]
          ),
        ],
      ),
    );
  }
}