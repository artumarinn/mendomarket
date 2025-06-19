import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';
import 'package:mendomarket/widgets/common/category_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mendomarket/features/categories/categories_page.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 16, bottom: 10),
          child: Text(
            "Categorías",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoryItem(icon: FontAwesomeIcons.vest, label: 'Moda', onTap: () {
              print('Moda tapped');
            }),
            CategoryItem(icon: Icons.print, label: 'Imprenta', onTap: () {
              print('Imprenta tapped');
            }),
            CategoryItem(icon: FontAwesomeIcons.cube, label: '3D', onTap: () {
              print('3D tapped');
            }),
            CategoryItem(icon: FontAwesomeIcons.noteSticky, label: 'Calcomania', onTap: () {
              print('Calcomania tapped');
            }),
            CategoryItem(
              icon: Icons.add,
              label: 'Más',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoriesPage()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}