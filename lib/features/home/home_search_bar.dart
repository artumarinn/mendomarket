import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onSearchSubmitted;
  final ValueChanged<String>? onChanged;

  const HomeSearchBar({
    super.key,
    required this.controller,
    this.onSearchSubmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Buscar productos...',
        prefixIcon: Icon(Icons.search, color: AppColors.primaryColor),
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  controller.clear();
                  if (onChanged != null) {
                    onChanged!('');
                  }
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      ),
      onSubmitted: (value) {
        if (onSearchSubmitted != null) {
          onSearchSubmitted!(value);
        }
      },
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
    );
  }
}