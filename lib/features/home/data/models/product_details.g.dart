// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    ProductDetails(
      mainCollection: json['mainCollection'] as String,
      department: json['department'] as String,
      productId: json['productId'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
      image: json['image'] as String,
      rate: (json['rate'] as num).toDouble(),
      isFavorite: json['isFavorite'] as bool? ?? false,
      isCartProduct: json['isCartProduct'] as bool? ?? false,
      favoriteId: json['favoriteId'] as String?,
    )..cartId = json['cartId'] as String?;

Map<String, dynamic> _$ProductDetailsToJson(ProductDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
      'rate': instance.rate,
      'isFavorite': instance.isFavorite,
      'isCartProduct': instance.isCartProduct,
      'productId': instance.productId,
      'mainCollection': instance.mainCollection,
      'department': instance.department,
      'favoriteId': instance.favoriteId,
      'cartId': instance.cartId,
    };
