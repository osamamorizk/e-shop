import 'package:hive/hive.dart';
part 'cart_product_model.g.dart';

@HiveType(typeId: 0)
class CartProductModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final num price;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String image;
  @HiveField(6)
  int count;

  CartProductModel({
    required this.title,
    required this.id,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.count,
  });

  factory CartProductModel.fromJson(json) {
    return CartProductModel(
      title: json['title'],
      id: json['id'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      count: json['count'],
    );
  }
}
