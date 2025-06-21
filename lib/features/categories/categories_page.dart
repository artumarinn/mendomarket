import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mendomarket/widgets/common/custom_app_bar.dart';
import 'package:mendomarket/core/app_colors.dart';

/// Represents a single category with a name and icon.
class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}

/// A list of all available categories.
final List<Category> allAvailableCategories = [
  Category(icon: FontAwesomeIcons.vest, name: 'Moda'),
  Category(icon: Icons.print, name: 'Imprenta'),
  Category(icon: FontAwesomeIcons.cube, name: '3D'),
  Category(icon: FontAwesomeIcons.noteSticky, name: 'Calcomania'),
  Category(name: 'Tecnología', icon: Icons.laptop_mac),
  Category(name: 'Hogar y Decoración', icon: Icons.chair),
  Category(name: 'Artesanía', icon: Icons.brush),
  Category(name: 'Joyería', icon: Icons.diamond),
  Category(name: 'Libros', icon: Icons.book),
  Category(name: 'Deportes', icon: Icons.sports_soccer),
];

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Todas las Categorías', centerTitle: true,),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.8,
        ),
        itemCount: allAvailableCategories.length,
        itemBuilder: (context, index) {
          final category = allAvailableCategories[index];
          return Card(
            color: AppColors.secondaryColor,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () {
                print('Category tapped: ${category.name}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You tapped: ${category.name}')),
                );
              },
              borderRadius: BorderRadius.circular(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    category.icon,
                    size: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}