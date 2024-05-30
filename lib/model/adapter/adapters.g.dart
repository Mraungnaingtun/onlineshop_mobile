import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final int productId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final int stockQuantity;

  @HiveField(5)
  final int categoryId;

  @HiveField(6)
  final int brandId;

  @HiveField(7)
  final DateTime createdAt;

  @HiveField(8)
  final DateTime updatedAt;

  Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.stockQuantity,
    required this.categoryId,
    required this.brandId,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor to convert from JSON (no changes)

  // toJson method (no changes)
}
