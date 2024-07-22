import 'package:json_annotation/json_annotation.dart';
part 'collection_details.g.dart';

@JsonSerializable()
class CollectionDetails {
  final String name, discount, description;

  CollectionDetails({
    required this.name,
    required this.discount,
    required this.description,
  });

  factory CollectionDetails.fromJson(Map<String, dynamic> json) =>
      _$CollectionDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionDetailsToJson(this);
}
