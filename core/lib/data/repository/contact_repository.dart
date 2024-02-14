import 'package:core/common/result.dart';
import 'package:core/data/data_source/local_storage_data_source.dart';
import 'package:core/data/model/contact.dart';

class ContactRepository {
  final LocalStorageDataSource dataSource;

  ContactRepository(this.dataSource);

  Future<Result<List<Contact>?, LocalStorageErrorType>> getContactList() async {
    return dataSource.getContactList();
  }

  Future<void> addContact(Contact data) async {
    return dataSource.addContact(data);
  }

  Future<void> updateContact(int id) async {
    return dataSource.updateContact(id);
  }

  Future<void> deleteContact(int id) {
    return dataSource.deleteContact(id);
  }

  Future<Result<List<Contact>?, LocalStorageErrorType>> searchContactsByFullName(String fullName) async {
    return dataSource.searchContactsByFullName(fullName);
  }
}