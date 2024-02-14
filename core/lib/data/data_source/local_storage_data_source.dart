import 'package:core/common/error_type_mixin.dart';
import 'package:core/data/model/contact.dart';

import '../../common/result.dart';

abstract class LocalStorageDataSource {
  // Fetch contact list from a Hive local database
  Future<Result<List<Contact>?, LocalStorageErrorType>> getContactList();

  // Store a contact in a Hive local database
  Future<void> addContact(Contact data);

  // Update a contact in a Hive local database
  Future<void> updateContact(int id);

  // Update a contact in a Hive local database
  Future<void> deleteContact(int id);

  // Search contact by full name
  Future<Result<List<Contact>?, LocalStorageErrorType>> searchContactsByFullName(String fullName);
}

enum LocalStorageErrorType with ErrorTypeEnumMixin {
  isarError,
  noData,
  general,
}
