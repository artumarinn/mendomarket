
class Product {
  final String title;
  final String price;
  final String location;
  final String image;

  Product({
    required this.title,
    required this.price,
    required this.location,
    required this.image,
  });

  factory Product.fromMap(Map<String, String> map) {
    return Product(
      title: map['title']!,
      price: map['price']!,
      location: map['location']!,
      image: map['image']!,
    );
  }
}