import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';
import 'package:mendomarket/widgets/common/products_tags.dart';

class HomeProducts extends StatefulWidget {
  const HomeProducts({super.key});

  @override
  State<HomeProducts> createState() => HomeProductsState();
}

class HomeProductsState extends State<HomeProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
          ProductsTags(),
        ],
      ),
    );
  }
}
