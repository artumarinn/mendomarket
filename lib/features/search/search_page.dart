import 'package:flutter/material.dart';
import 'package:mendomarket/features/home/home_search_bar.dart';
import 'package:mendomarket/widgets/common/custom_app_bar.dart';
import 'package:mendomarket/widgets/common/custom_nav_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Buscar',
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: const HomeSearchBar(),
    );
  }
}