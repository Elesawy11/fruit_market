// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    ProductDetails(
      productId: json['productId'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
      image: json['image'] as String,
      rate: (json['rate'] as num).toDouble(),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductDetailsToJson(ProductDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
      'rate': instance.rate,
      'isFavorite': instance.isFavorite,
      'productId': instance.productId,
    };
