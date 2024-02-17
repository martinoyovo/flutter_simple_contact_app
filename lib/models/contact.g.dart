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
      id: fields[0] as int,
      firstname: fields[1] as String?,
      lastname: fields[2] as String?,
      nickname: fields[3] as String?,
      phone: fields[4] as String?,
      email: fields[5] as String?,
      notes: fields[6] as String?,
      groups: (fields[7] as List?)?.cast<Group>(),
      relationship: fields[8] as Relationship?,
    );
  }

  @override
  void write(BinaryWriter writer, Contact obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstname)
      ..writeByte(2)
      ..write(obj.lastname)
      ..writeByte(3)
      ..write(obj.nickname)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.notes)
      ..writeByte(7)
      ..write(obj.groups)
      ..writeByte(8)
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
        return Group.family;
      case 1:
        return Group.friends;
      case 2:
        return Group.colleagues;
      default:
        return Group.family;
    }
  }

  @override
  void write(BinaryWriter writer, Group obj) {
    switch (obj) {
      case Group.family:
        writer.writeByte(0);
        break;
      case Group.friends:
        writer.writeByte(1);
        break;
      case Group.colleagues:
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
        return Relationship.friend;
      case 1:
        return Relationship.brother;
      case 2:
        return Relationship.sister;
      case 3:
        return Relationship.parent;
      case 4:
        return Relationship.spouse;
      case 5:
        return Relationship.other;
      default:
        return Relationship.friend;
    }
  }

  @override
  void write(BinaryWriter writer, Relationship obj) {
    switch (obj) {
      case Relationship.friend:
        writer.writeByte(0);
        break;
      case Relationship.brother:
        writer.writeByte(1);
        break;
      case Relationship.sister:
        writer.writeByte(2);
        break;
      case Relationship.parent:
        writer.writeByte(3);
        break;
      case Relationship.spouse:
        writer.writeByte(4);
        break;
      case Relationship.other:
        writer.writeByte(5);
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
