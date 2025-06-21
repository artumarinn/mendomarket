import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key, // <-- ¡Aquí estaba la corrección principal! Se usa 'super.key' para simplificar.
    required this.title,
    this.actions, required bool centerTitle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins', 
          ),
        ),
      ),
      actions: actions,
    );
  }
}