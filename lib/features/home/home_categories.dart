import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60, 
          height: 60, 
          decoration: BoxDecoration(
            color: AppColors.secondaryColor, 
            shape: BoxShape.circle,
            boxShadow: const [ 
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            Icons.person, 
            color: Colors.white, 
            size: 40, 
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Ropa & Accesorios', 
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500, 
            color: Colors.black87, 
          ),
        ),
      ],
    );
  }
}