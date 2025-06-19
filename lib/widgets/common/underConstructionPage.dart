// lib/widgets/common/under_construction_page.dart
import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';

class UnderConstructionPage extends StatelessWidget {
  final String title; 
  final String imagePath; 
  final String message; 
  final String? subMessage; 

  const UnderConstructionPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.message,
    this.subMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 300, 
            height: 300, 
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 5),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          if (subMessage != null)
            const SizedBox(height: 5),
          if (subMessage != null)
            Text(
              subMessage!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}