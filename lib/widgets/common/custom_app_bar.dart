import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBack;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = false,
    this.showBack = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Desactiva la flecha por defecto
      leading: showBack
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new, 
                color: Colors.white,      
                size: 20,              
              ),
              onPressed: () => Navigator.of(context).maybePop(),
            )
          : null,
      centerTitle: centerTitle,
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