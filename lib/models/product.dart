class Product {
  final String id;
  final String title;
  final String price;
  final String location;
  final String imageUrl;
  final double rating;
  final String description;
  final String sellerInfo;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.location,
    required this.imageUrl,
    this.rating = 0.0,
    this.description = 'Este producto no tiene descripcion.',
    this.sellerInfo = 'Unknown Seller',
  });

  /// Creates a [Product] from a JSON map.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      title: json['title'] as String,
      price: json['price'] as String,
      location: json['location'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? 'No description available.',
      sellerInfo: json['sellerInfo'] as String? ?? 'Unknown Seller',
    );
  }

  /// Converts a [Product] to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'location': location,
      'imageUrl': imageUrl,
      'rating': rating,
      'description': description,
      'sellerInfo': sellerInfo,
    };
  }
}