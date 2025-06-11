import 'package:flutter/material.dart';
import 'package:mendomarket/features/home/home_banner.dart';
import 'package:mendomarket/features/home/home_categories.dart';
import 'package:mendomarket/features/home/home_products.dart';
import 'package:mendomarket/features/home/home_search_bar.dart';
import 'package:mendomarket/widgets/common/custom_app_bar.dart';
import 'package:mendomarket/widgets/common/custom_nav_bar.dart';
import 'package:mendomarket/widgets/common/product_card.dart';

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
      appBar: CustomAppBar(
        title: "MendoMarket",
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white), 
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: const Column(children: [HomeSearchBar(), HomeCategories(), HomeProducts()]), 
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}