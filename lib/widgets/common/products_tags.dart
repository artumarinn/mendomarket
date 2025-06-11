import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';

class ProductsTags extends StatefulWidget {
  const ProductsTags({super.key});

  @override
  State<ProductsTags> createState() => _ProductsTagsState();
}

class _ProductsTagsState extends State<ProductsTags> {
  final List<String> filters = ['Todo', 'Recientes', 'Destacado'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: List.generate(filters.length, (index) {
        final isSelected = index == selectedIndex;
        return ChoiceChip(
          label: Text(filters[index]),
          selected: isSelected,
          selectedColor: const Color(0xFFE9C46A),
          backgroundColor: AppColors.inputBackground,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color:
                  isSelected
                      ? AppColors.secondaryColor
                      : AppColors.inputBackground,
              width: 2.0, 
            ),
          ),
          onSelected: (_) {
            setState(() {
              selectedIndex = index;
              // agregar metodo para agregar productos
            });
          },
        );
      }),
    );
  }
}
