// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionDetails _$CollectionDetailsFromJson(Map<String, dynamic> json) =>
    CollectionDetails(
      name: json['name'] as String,
      discount: json['discount'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CollectionDetailsToJson(CollectionDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'discount': instance.discount,
      'description': instance.description,
    };
