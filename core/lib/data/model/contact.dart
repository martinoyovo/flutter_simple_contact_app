import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact {
  @HiveField(0)
  String? firstname;
  @HiveField(1)
  String? lastname;
  @HiveField(2)
  String? nickname;
  @HiveField(3)
  String? phone;
  @HiveField(4)
  String? email;
  @HiveField(5)
  String? notes;
  @HiveField(6)
  List<Group>? groups;
  @HiveField(7)
  Relationship? relationship;

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
}

@HiveType(typeId: 1)
enum Group {
  @HiveField(0)
  Family,
  @HiveField(1)
  Friends,
  @HiveField(2)
  Colleagues,
}

@HiveType(typeId: 2)
enum Relationship {
  @HiveField(0)
  Friend,
  @HiveField(1)
  Brother,
  @HiveField(2)
  Sister,
  @HiveField(3)
  Parent,
  @HiveField(4)
  Father,
  @HiveField(5)
  Mother,
  @HiveField(6)
  Relative,
  @HiveField(7)
  Spouse,
  @HiveField(8)
  Other,
}