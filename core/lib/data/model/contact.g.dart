// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactAdapter extends TypeAdapter<Contact> {
  @override
  final int typeId = 0;

  @override
  Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contact(
      firstname: fields[0] as String?,
      lastname: fields[1] as String?,
      nickname: fields[2] as String?,
      phone: fields[3] as String?,
      email: fields[4] as String?,
      notes: fields[5] as String?,
      groups: (fields[6] as List?)?.cast<Group>(),
      relationship: fields[7] as Relationship?,
    );
  }

  @override
  void write(BinaryWriter writer, Contact obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.firstname)
      ..writeByte(1)
      ..write(obj.lastname)
      ..writeByte(2)
      ..write(obj.nickname)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.notes)
      ..writeByte(6)
      ..write(obj.groups)
      ..writeByte(7)
      ..write(obj.relationship);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GroupAdapter extends TypeAdapter<Group> {
  @override
  final int typeId = 1;

  @override
  Group read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Group.Family;
      case 1:
        return Group.Friends;
      case 2:
        return Group.Colleagues;
      default:
        return Group.Family;
    }
  }

  @override
  void write(BinaryWriter writer, Group obj) {
    switch (obj) {
      case Group.Family:
        writer.writeByte(0);
        break;
      case Group.Friends:
        writer.writeByte(1);
        break;
      case Group.Colleagues:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RelationshipAdapter extends TypeAdapter<Relationship> {
  @override
  final int typeId = 2;

  @override
  Relationship read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Relationship.Friend;
      case 1:
        return Relationship.Brother;
      case 2:
        return Relationship.Sister;
      case 3:
        return Relationship.Parent;
      case 4:
        return Relationship.Father;
      case 5:
        return Relationship.Mother;
      case 6:
        return Relationship.Relative;
      case 7:
        return Relationship.Spouse;
      case 8:
        return Relationship.Other;
      default:
        return Relationship.Friend;
    }
  }

  @override
  void write(BinaryWriter writer, Relationship obj) {
    switch (obj) {
      case Relationship.Friend:
        writer.writeByte(0);
        break;
      case Relationship.Brother:
        writer.writeByte(1);
        break;
      case Relationship.Sister:
        writer.writeByte(2);
        break;
      case Relationship.Parent:
        writer.writeByte(3);
        break;
      case Relationship.Father:
        writer.writeByte(4);
        break;
      case Relationship.Mother:
        writer.writeByte(5);
        break;
      case Relationship.Relative:
        writer.writeByte(6);
        break;
      case Relationship.Spouse:
        writer.writeByte(7);
        break;
      case Relationship.Other:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RelationshipAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
