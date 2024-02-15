import 'package:core/common/result.dart';
import 'package:core/data/data_source/local_storage_data_source.dart';
import 'package:core/data/model/contact.dart';

class ContactRepository {
  final LocalStorageDataSource dataSource;

  ContactRepository(this.dataSource);

  Future<Result<List<Contact>?, LocalStorageErrorType>> getContactList() async {
    return dataSource.getContactList();
  }

  Future<Result<Contact?, LocalStorageErrorType>> getContactById(int id) {
    return dataSource.getContactById(id);
  }

  Future<void> addContact({
    String? firstname,
    String? lastname,
    String? nickname,
    String? phone,
    String? email,
    String? notes,
    List<Group>? groups,
    Relationship? relationship
  }) async {
    return dataSource.addContact(
      firstname: firstname,
      lastname: lastname,
      nickname: nickname,
      phone: phone,
      email: email,
      notes: phone,
      groups: groups,
      relationship: relationship
    );
  }

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
    return dataSource.updateContact(id);
  }

  Future<void> deleteContact(int id) {
    return dataSource.deleteContact(id);
  }

  /*Future<Result<List<Contact>?, LocalStorageErrorType>> filteredContactList(String? query) async {
    return dataSource.filteredContactList(query);
  }*/
}