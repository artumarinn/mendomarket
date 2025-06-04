import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';

class CustomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {

  void _handleNavigation(int index) {
    if (index == widget.currentIndex) return;

    switch (index) {
      case 0:
       Navigator.pushReplacementNamed(context, '/home');
       break;
      case 1:
       Navigator.pushReplacementNamed(context, '/search');
       break;
      case 2:
       Navigator.pushReplacementNamed(context, '/chat');
       break;
      case 3:
       Navigator.pushReplacementNamed(context, '/favorite');
       break;
      case 4:
       Navigator.pushReplacementNamed(context, '/profile');
       break;
    }
    widget.onTap(index);
  }

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
          currentIndex: widget.currentIndex,
          selectedItemColor: AppColors.secondaryColor,
          unselectedItemColor: AppColors.backgroundColor,
          onTap: _handleNavigation,
        ),
      ),
    );
  }
}
