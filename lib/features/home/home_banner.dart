import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 12, left: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [AppColors.primaryColor, Color.fromARGB(169, 84, 131, 98)],
          ),
          color: AppColors.primaryColor,
        ),
        width: double.infinity,
        height: 120,
        child: Column(
          // children: [
          //   Text(
          //     "¡Nueva Feria!",
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 22,
          //       fontWeight: FontWeight.bold,
          //       fontFamily: 'Poppins',
          //     ),
          //   ),
          // ],
        ),
      ),
    );
  }
}
