import 'package:core/common/result.dart';
import 'package:core/data/data_source/local_storage_data_source.dart';
import 'package:core/data/model/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class LocalStorageDataSourceImpl extends LocalStorageDataSource {
  static String contactsBoxName = "contacts";

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<Contact>(ContactAdapter());
    Hive.registerAdapter<Group>(GroupAdapter());
    Hive.registerAdapter<Relationship>(RelationshipAdapter());
    await Hive.openBox<Contact>(contactsBoxName);
  }

  Box<Contact> contactsBox = Hive.box<Contact>(contactsBoxName);

  @override
  Future<void> addContact({
    String? firstname,
    String? lastname,
    String? nickname,
    String? phone,
    String? email,
    String? notes,
    List<Group>? groups,
    Relationship? relationship}) async {
    final contact = Contact(
      firstname: firstname,
      lastname: lastname,
      nickname: nickname,
      phone: phone,
      email: email,
      notes: phone,
      groups: groups,
      relationship: relationship
    );

    await contactsBox.add(contact);
  }

  @override
  Future<void> deleteContact(int id) async {
    await contactsBox.deleteAt(id);
  }

  @override
  Future<Result<List<Contact>, LocalStorageErrorType>> getContactList() async {
    final contacts = contactsBox.values.toList();
    if(contacts.isEmpty) {
      return LocalStorageErrorType.noData.toFailure();
    }
    return Success(contacts);
  }

  @override
  Future<void> updateContact(int id, {
    String? firstname,
    String? lastname,
    String? nickname,
    String? phone,
    String? email,
    String? notes,
    List<Group>? groups,
    Relationship? relationship
  }) async {
    final updatedContact = Contact(
      firstname: firstname,
      lastname: lastname,
      nickname: nickname,
      phone: phone,
      email: email,
      notes: phone,
      groups: groups,
      relationship: relationship
    );

    await contactsBox.putAt(id, updatedContact);
  }

  @override
  Future<Result<Contact, LocalStorageErrorType>> getContactById(int id) async {
    final Contact? contact = contactsBox.getAt(id);
    if(contact == null) {
      return LocalStorageErrorType.noData.toFailure();
    }
    return Success(contact);
  }
}