class Product {
  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final images = json['images'] as List<dynamic>;

    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      image: images.isNotEmpty ? images[0] as String : '',
    );
  }
  final String title;
  final int id;
  final String description;
  final double price;
  final String image;
}
