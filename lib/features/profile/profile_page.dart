import 'package:flutter/material.dart';
import 'package:mendomarket/widgets/common/custom_app_bar.dart';
import 'package:mendomarket/widgets/common/custom_nav_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Perfil', centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 500),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/onboarding');
            },
            child: Text(
              "Cerrar Sesion",
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
