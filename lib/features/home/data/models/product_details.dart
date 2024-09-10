import 'package:json_annotation/json_annotation.dart';
part 'product_details.g.dart';

@JsonSerializable()
class ProductDetails {
  final String name, price, image;
  final double rate;
  bool isFavorite;
  final String productId;

  ProductDetails({
    required this.productId,
    required this.name,
    required this.price,
    required this.image,
    required this.rate,
    this.isFavorite = false,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsToJson(this);
}
