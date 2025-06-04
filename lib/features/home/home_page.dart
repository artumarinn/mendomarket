import 'package:flutter/material.dart';
import 'package:mendomarket/widgets/common/custom_app_bar.dart';
import 'package:mendomarket/widgets/common/custom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

    @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'MendoMarket'),
      body: Center(
        child: Text(
          'Welcome to MendoMarket!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}