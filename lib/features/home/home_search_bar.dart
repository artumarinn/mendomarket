import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final VoidCallback? onSearchSubmitted; // Nuevo callback para cuando se envía la búsqueda

  const HomeSearchBar({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSearchSubmitted, // Lo agregamos al constructor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          onSubmitted: (value) { 
            if (onSearchSubmitted != null) {
              onSearchSubmitted!();
            }
          },
          decoration: InputDecoration(
            hintText: "Buscar productos",
            prefixIcon: const Icon(Icons.search, color: Colors.black),
            filled: true,
            fillColor: const Color.fromARGB(68, 84, 131, 98),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 14,
            ),
          ),
        ),
      ),
    );
  }
}