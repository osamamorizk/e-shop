class ProductModel {
  final String title;
  final int id;
  final num price;
  final String description;
  final String category;
  final String image;
  final int rate;

  ProductModel(
      {required this.title,
      required this.id,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rate});

  factory ProductModel.fromJson(json) {
    return ProductModel(
      title: json['title'],
      id: json['id'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rate: json['rating']['rate'],
    );
  }
}
