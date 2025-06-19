import 'package:mendomarket/models/product.dart';

/// Helper function to find a product by its ID.
Product? findProductById(String id) {
  try {
    return allProducts.firstWhere((product) => product.id == id);
  } catch (e) {
    print('Error: Product with ID $id not found.');
    return null;
  }
}

/// List of all available products.
final List<Product> allProducts = [
  Product(
    id: 'prod001',
    title: "Gorra Personalizada Premium",
    price: "7500",
    location: "Godoy Cruz, Mendoza",
    imageUrl: "assets/images/products/gorra.png",
    rating: 4.8,
    description: "Diseña tu propia gorra con bordados o estampados. Ideal para regalos, eventos o tu marca. Amplia variedad de colores y estilos.",
    sellerInfo: "Cap's Design Mza - WhatsApp: +54 9 261 1234567",
  ),
  Product(
    id: 'prod002',
    title: "Remera Sublimada de Diseño",
    price: "9800",
    location: "Ciudad, Mendoza",
    imageUrl: "assets/images/products/remeraSublimada.png",
    rating: 4.7,
    description: "Remeras de alta calidad con sublimación full color. Crea tus diseños únicos o elige de nuestro catálogo. Talles XS a XXL.",
    sellerInfo: "PrintStyle Mendoza - Email: info@printstyle.com.ar",
  ),
  Product(
    id: 'prod003',
    title: "Mate 3D",
    price: "15000",
    location: "Luján de Cuyo, Mendoza",
    imageUrl: "assets/images/products/mate3d.png",
    rating: 4.9,
    description: "Sin descripcion",
    sellerInfo: "Objetos 3D Mza - Instagram: @objetos3dmza",
  ),
  Product(
    id: 'prod004',
    title: "Llavero 3D Personalizado",
    price: "1200",
    location: "Maipú, Mendoza",
    imageUrl: "assets/images/products/llavero_3d.png",
    rating: 4.4,
    description: "Llaveros únicos impresos en 3D con el nombre, logo o forma que desees. Materiales resistentes y duraderos.",
    sellerInfo: "Objetos 3D Mza - Instagram: @objetos3dmza",
  ),
  Product(
    id: 'prod005',
    title: "Taza",
    price: "8500",
    location: "San Martín, Mendoza",
    imageUrl: "assets/images/products/tazaSublimada.png",
    rating: 4.6,
    description: "Taza subliamda personalizada",
    sellerInfo: "Mendoza Print Works - Web: mendozaprintworks.com",
  ),
  Product(
    id: 'prod006',
    title: "Servicio de Impresión 3D por Encargo",
    price: "Presupuesto",
    location: "Ciudad, Mendoza",
    imageUrl: "assets/images/products/impresion_3d_servicio.png",
    rating: 4.9,
    description: "Ofrecemos servicios de impresión 3D a medida. Desde prototipos hasta piezas funcionales. Consultar por presupuesto sin cargo.",
    sellerInfo: "Innovate 3D Mza - Email: contacto@innovate3d.com",
  ),
  Product(
    id: 'prod007',
    title: "Taza Mágica Sublimada",
    price: "4500",
    location: "Guaymallén, Mendoza",
    imageUrl: "assets/images/products/taza_magica.png",
    rating: 4.7,
    description: "Taza mágica negra que revela tu diseño personalizado al añadir líquido caliente. ¡Sorprende a todos!",
    sellerInfo: "Regalos Sorpresa Mza - Tel: 261-7778899",
  ),
  Product(
    id: 'prod008',
    title: "Remera 'Mendoza Vibes'",
    price: "8900",
    location: "Godoy Cruz, Mendoza",
    imageUrl: "assets/images/products/remera_mendoza_vibes.png",
    rating: 4.5,
    description: "Remera exclusiva con diseño 'Mendoza Vibes'. Ideal para amantes de la provincia. Algodón premium.",
    sellerInfo: "Mendoza Roots Apparel - Instagram: @mendozaroots",
  ),
  Product(
    id: 'prod009',
    title: "Mate de Viaje Térmico",
    price: "9000",
    location: "Tunuyán, Mendoza",
    imageUrl: "assets/images/products/mate_termico.png",
    rating: 4.6,
    description: "Mate térmico de acero inoxidable, ideal para llevar tu mate a donde quieras. Mantiene la temperatura por horas.",
    sellerInfo: "Aventura Matera - Web: aventuramatera.com",
  ),
  Product(
    id: 'prod010',
    title: "Cuadro Decorativo Impreso 3D",
    price: "12000",
    location: "Luján de Cuyo, Mendoza",
    imageUrl: "assets/images/products/cuadro_3d.png",
    rating: 4.8,
    description: "Cuadros con relieves impresos en 3D, una forma moderna y original de decorar tus espacios. Varios diseños y tamaños.",
    sellerInfo: "Art & Tech Studio - Email: arttechmza@gmail.com",
  ),
  Product(
    id: 'prod011',
    title: 'Agenda Personalizada con Tapa 3D',
    price: '6500',
    location: 'Ciudad, Mendoza',
    imageUrl: 'assets/images/products/agenda_3d.png',
    rating: 4.5,
    description: 'Agenda con tapa personalizada impresa en 3D. Ideal para estudiantes, profesionales o como regalo corporativo.',
    sellerInfo: 'Paper & Print 3D - Tel: 261-3334455',
  ),
  Product(
    id: 'prod012',
    title: 'Funda para Celular 3D',
    price: '3800',
    location: 'Guaymallén, Mendoza',
    imageUrl: 'assets/images/products/funda_celular_3d.png',
    rating: 4.3,
    description: 'Funda para celular con diseño exclusivo impreso en 3D. Protección y estilo para tu dispositivo.',
    sellerInfo: 'Mobile Art 3D - Instagram: @mobileart3d',
  ),
];

/// List of featured products for the home page.
final List<Product> featuredProducts = [
  findProductById('prod001')!,
  findProductById('prod003')!,
  findProductById('prod006')!,
  findProductById('prod002')!,
];

/// List of new arrival products for the home page.
final List<Product> newArrivalsProducts = [
  findProductById('prod004')!,
  findProductById('prod007')!,
  findProductById('prod009')!,
  findProductById('prod011')!,
  findProductById('prod012')!,
];