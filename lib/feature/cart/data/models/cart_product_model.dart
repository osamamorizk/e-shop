class CartProductModel {
  final String title;
  final int id;
  final num price;
  final String description;
  final String category;
  final String image;

  CartProductModel({
    required this.title,
    required this.id,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory CartProductModel.fromJson(json) {
    return CartProductModel(
      title: json['title'],
      id: json['id'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
}
