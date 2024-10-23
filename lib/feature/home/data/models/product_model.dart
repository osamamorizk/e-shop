import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel extends HiveObject {
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
  final int count;
  @HiveField(7)
  final num rate;

  ProductModel(
      {required this.title,
      required this.count,
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
      count: json['count'] ?? 1,
    );
  }
  factory ProductModel.fromFavo(json) {
    return ProductModel(
      title: json['title'],
      id: json['id'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rate: 1,
      count: json['count'] ?? 1,
    );
  }

  ProductModel copyWith({
    String? title,
    int? id,
    num? price,
    String? description,
    String? category,
    String? image,
    int? count,
    num? rate,
  }) {
    return ProductModel(
      title: title ?? this.title,
      id: id ?? this.id,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      count: count ?? this.count,
      rate: rate ?? this.rate,
    );
  }
}
