import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'relationship.g.dart';

@JsonSerializable()
@embedded
class Relationship {
  final String? name;

  Relationship({this.name});

  factory Relationship.fromJson(Map<String, dynamic> json) => _$RelationshipFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipToJson(this);
}