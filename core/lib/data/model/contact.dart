import 'package:core/data/model/group.dart';
import 'package:core/data/model/relationship.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
@collection
class Contact {
  Id id = Isar.autoIncrement;
  final String? firstname;
  final String? lastname;
  final String? nickname;
  final String? phone;
  final String? email;
  final String? notes;
  final List<Group>? groups;
  final Relationship? relationship;

  Contact({
    this.firstname,
    this.lastname,
    this.nickname,
    this.phone,
    this.email,
    this.notes,
    this.groups,
    this.relationship
  });

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}