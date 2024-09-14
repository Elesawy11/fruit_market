import 'package:json_annotation/json_annotation.dart';
part 'product_details.g.dart';

@JsonSerializable()
class ProductDetails {
  final String name, price, image;
  final double rate;
  bool isFavorite, isCartProduct;
  final String productId;
  final String mainCollection,department;
 String? favoriteId;

  ProductDetails( {
    required this.mainCollection,
    required this.department,
    required this.productId,
    required this.name,
    required this.price,
    required this.image,
    required this.rate,
    this.isFavorite = false,
    this.isCartProduct = false,
    this.favoriteId,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsToJson(this);
}
