class Product {
  final String name;
  final String description;
  final double price;
  final List<String> imageUrls;
  int quantity; // Add quantity property

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrls,
    this.quantity = 1, // Initialize quantity to 1 by default
  });
}
