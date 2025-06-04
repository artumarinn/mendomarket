import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
      ),
      child: Container(
        color: AppColors.primaryColor,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, 
          elevation: 0,                         
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
          currentIndex: currentIndex,
          selectedItemColor: AppColors.secondaryColor,
          unselectedItemColor: AppColors.backgroundColor,
          onTap: onTap,
        ),
      ),
    );
  }
}
