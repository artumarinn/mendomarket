import 'package:flutter/material.dart';
import 'package:mendomarket/features/home/home_search_bar.dart';
import 'package:mendomarket/widgets/common/custom_app_bar.dart';
import 'package:mendomarket/widgets/common/custom_nav_bar.dart';
import 'package:mendomarket/data/product_data.dart'; 
import 'package:mendomarket/components/product.dart'; 
import 'package:mendomarket/widgets/common/product_card.dart'; 

class SearchPage extends StatefulWidget {
  final String? initialSearchQuery;

  const SearchPage({super.key, this.initialSearchQuery});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 1;
  final TextEditingController _searchController = TextEditingController();
  List<Product> _filteredProducts = []; 

  @override
  void initState() {
    super.initState();

    // Inicializa la lista filtrada con todos los productos disponibles
    _filteredProducts = List.from(allProducts);

    if (widget.initialSearchQuery != null && widget.initialSearchQuery!.isNotEmpty) {
      _searchController.text = widget.initialSearchQuery!;
      _filterProducts(widget.initialSearchQuery!);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProducts = List.from(allProducts); // Si la búsqueda está vacía, muestra todos
      } else {
        _filteredProducts = allProducts.where((product) {
          final productNameLower = product.title.toLowerCase(); // Usa product.title
          final productDescriptionLower = product.location.toLowerCase(); // O la descripción si la tuvieras
          final queryLower = query.toLowerCase();
          return productNameLower.contains(queryLower) ||
              productDescriptionLower.contains(queryLower);
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Buscar'),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Column(
        children: [
          HomeSearchBar(
            controller: _searchController,
            onChanged: _filterProducts,
            onSearchSubmitted: () => _filterProducts(_searchController.text),
          ),
          Expanded(
            child: _filteredProducts.isEmpty
                ? const Center(child: Text('No se encontraron productos.'))
                : ListView.builder(
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      return ProductCard( // Reutiliza tu ProductCard
                        title: product.title,
                        price: product.price,
                        location: product.location,
                        image: product.image,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}