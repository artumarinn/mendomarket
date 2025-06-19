// lib/features/search/search_page.dart

import 'package:flutter/material.dart';
import 'package:mendomarket/features/home/home_search_bar.dart';
import 'package:mendomarket/widgets/common/custom_app_bar.dart';
import 'package:mendomarket/widgets/common/custom_nav_bar.dart';
import 'package:mendomarket/models/product.dart';
import 'package:mendomarket/data/product_data.dart';
import 'package:mendomarket/widgets/common/product_card.dart';

class SearchPage extends StatefulWidget {
  final String? initialSearchQuery;

  const SearchPage({super.key, this.initialSearchQuery});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 1;
  late TextEditingController _searchController;
  List<Product> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialSearchQuery);
    _filterProducts(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// Filters products based on the given query.
  void _filterProducts(String query) {
    final lowerCaseQuery = query.toLowerCase();

    setState(() {
      _searchResults = allProducts.where((product) {
        return product.title.toLowerCase().contains(lowerCaseQuery) ||
            product.description.toLowerCase().contains(lowerCaseQuery) ||
            product.location.toLowerCase().contains(lowerCaseQuery);
      }).toList();
    });
  }

  /// Handles search submission.
  void _onSearchSubmitted(String value) {
    _filterProducts(value);
    FocusScope.of(context).unfocus();
  }

  /// Handles changes in the search input.
  void _onSearchChanged(String value) {
    _filterProducts(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Buscar'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HomeSearchBar(
              controller: _searchController,
              onSearchSubmitted: _onSearchSubmitted,
              onChanged: _onSearchChanged,
            ),
          ),
          Expanded(
            child: _searchResults.isEmpty && _searchController.text.isNotEmpty
                ? const Center(
                    child: Text('No se encuentran productos.'),
                  )
                : _searchResults.isEmpty && _searchController.text.isEmpty
                    ? const Center(
                        child: Text('Start typing to search for products...'),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(10.0),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          return ProductCard(product: _searchResults[index]);
                        },
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