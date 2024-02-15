import 'package:core/common/error_type_mixin.dart';
import 'package:core/data/model/contact.dart';

import '../../common/result.dart';

abstract class LocalStorageDataSource {
  // Fetch contact list from Hive local database
  Future<Result<List<Contact>, LocalStorageErrorType>> getContactList();

  // Get one contact from Hive local database
  Future<Result<Contact, LocalStorageErrorType>> getContactById(int id);

  // Store a contact in a Hive local database
  Future<void> addContact({
    String? firstname,
    String? lastname,
    String? nickname,
    String? phone,
    String? email,
    String? notes,
    List<Group>? groups,
    Relationship? relationship});

  // Update a contact in Hive local database
  Future<void> updateContact(int id);

  // Update a contact in Hive local database
  Future<void> deleteContact(int id);

  // Search contact by full name
  // Future<Result<List<Contact>, LocalStorageErrorType>> filteredContactList(String? query);
}

enum LocalStorageErrorType with ErrorTypeEnumMixin {
  isarError,
  noData,
}
