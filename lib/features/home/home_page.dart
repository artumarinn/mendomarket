import 'package:flutter/material.dart';
import 'package:mendomarket/features/home/home_banner.dart';
import 'package:mendomarket/features/home/home_categories.dart';
import 'package:mendomarket/features/home/home_products.dart';
import 'package:mendomarket/features/home/home_search_bar.dart';
import 'package:mendomarket/widgets/common/custom_app_bar.dart';
import 'package:mendomarket/widgets/common/custom_nav_bar.dart';
import 'package:mendomarket/features/search/search_page.dart'; // Importa la SearchPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSearchSubmittedFromHome() {
    // Cuando el usuario envía la búsqueda desde el Home
    final searchText = _searchController.text;
    if (searchText.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchPage(initialSearchQuery: searchText), // Pasa el texto de búsqueda
        ),
      );
      _searchController.clear(); // Opcional: limpia la barra de búsqueda después de navegar
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
      body: Column(
        children: [
          HomeSearchBar(
            controller: _searchController,
            onSearchSubmitted: _onSearchSubmittedFromHome, // Asigna el callback
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  HomeBanner(),
                  HomeCategories(),
                  HomeProducts(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}