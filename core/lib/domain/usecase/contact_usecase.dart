import 'package:core/common/error_type_mixin.dart';
import 'package:core/common/result.dart';
import 'package:core/common/utils/email_validator.dart';
import 'package:core/data/data_source/local_storage_data_source.dart';
import 'package:core/data/model/contact.dart';
import 'package:core/data/model/group.dart';
import 'package:core/data/model/relationship.dart';
import 'package:core/data/repository/contact_repository.dart';


class ContactUseCase {
  final ContactRepository repository;

  ContactUseCase(this.repository);

  Future<Result<List<Contact>, LocalStorageErrorType>> getContactList() async {
    // Check if local data is present
    var storedContacts = await repository.getContactList();

    switch(storedContacts) {
      case Success():
        final localData = storedContacts.data;
        if (localData != null && localData.isNotEmpty) {
          return Success(localData);
        }
        else {
          return LocalStorageErrorType.noData.toFailure();
        }
      case Failure():
        return LocalStorageErrorType.isarError.toFailure();
    }
  }

  Future<Result<bool, AddContactErrorType>> addContact({
    String? firstname,
    String? lastname,
    String? nickname,
    String? phone,
    String? email,
    String? notes,
    List<Group>? groups,
    Relationship? relationship
  }) async {
    if(validateFirstname(firstname) ||
        validateLastname(lastname) ||
        validateNickname(nickname) ||
        validateEmail(email) ||
        validatePhone(phone) ||
        validateNotes(notes) ||
        validateRelationship(relationship)
    ) {
      Contact newContact = Contact(
        firstname: firstname,
        lastname: lastname,
        nickname: nickname,
        phone: phone,
        email: email,
        notes: phone,
        groups: groups,
        relationship: relationship
      );

      await repository.addContact(newContact);
      return Success(true);
    }
    else {
      return AddContactErrorType.emptyFields.toFailure();
    }
  }

  Future<void> updateContact(int id) async {
    await repository.updateContact(id);
  }

  Future<void> deleteContact(int id) async {
    await repository.updateContact(id);
  }

  Future<Result<List<Contact>?, LocalStorageErrorType>> searchContactsByFullName(String fullName) async {
    final searchedContacts = await repository.searchContactsByFullName(fullName);
    switch(searchedContacts) {
      case Success():
        final localData = searchedContacts.data;
        if (localData != null && localData.isNotEmpty) {
          return Success(localData);
        }
        else {
          return LocalStorageErrorType.noData.toFailure();
        }
      case Failure():
        return LocalStorageErrorType.isarError.toFailure();
    }
  }

  bool validateFirstname(String? firstname) {
    return firstname != null && firstname.isNotEmpty;
  }

  bool validateLastname(String? lastname) {
    return lastname != null && lastname.isNotEmpty;
  }

  bool validateNickname(String? nickname) {
    return nickname != null && nickname.isNotEmpty;
  }

  bool validatePhone(String? phone) {
    return phone != null && phone.isNotEmpty;
  }

  bool validateNotes(String? notes) {
    return notes != null && notes.isNotEmpty;
  }

  bool validateRelationship(Relationship? relationship) {
    return relationship != null;
  }

  bool validateEmail(String? email) {
    if(email == null) {
      return false;
    }
    final result = EmailValidator().isValidEmail(email.toLowerCase());
    switch(result) {
      case Success():
        return true;
      case Failure():
        return false;
    }
  }

}

enum AddContactErrorType with ErrorTypeEnumMixin {
  emptyFields
}