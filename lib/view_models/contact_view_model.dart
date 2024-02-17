import 'package:simple_contact_app/locator.dart';
import 'package:simple_contact_app/models/contact.dart';
import 'package:simple_contact_app/services/contact.service.dart';
import 'package:stacked/stacked.dart';

class ContactViewModel extends ReactiveViewModel {
  final _contactService = locator<ContactService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_contactService];

  List<Contact> get contacts => _contactService.contacts;
  List<Contact> get filteredContacts => _contactService.filteredContacts;

  List<Group> get groups => _contactService.groups;

  Relationship? get relationship => _contactService.relationship;

  Contact get selectedContact => _contactService.selectedContact;

  get hintFirstName => 'First Name';
  get hintLastName => 'Last Name';
  get hintNickName => 'Nick Name';
  get hintEmail => 'Email';
  get hintPhone => 'Phone No.';
  get hintNotes => 'Notes';
  get hintSearch => 'Search Contacts';

  String? _firstName;
  String? _lastName;
  String? _nickName;
  String? _email;
  String? _phone;
  String? _notes;

  void addContact() {
    _contactService.addContact(
      firstname: _firstName,
      lastname: _lastName,
      nickname: _nickName,
      email: _email,
      phone: _phone,
      notes: _notes,
    );
  }

  void updateContact() {
    _contactService.updateContact(
      firstname: _firstName,
      lastname: _lastName,
      nickname: _nickName,
      email: _email,
      phone: _phone,
      notes: _notes,
    );
  }

  void updateGroup(Group group) {
    _contactService.updateGroup(group);
  }

  void deleteContact() {
    _contactService.deleteContact();
  }

  void updateRelationship(Relationship? relationship) {
    if(relationship != null) {
      _contactService.updateRelationship(relationship);
    }
  }

  void setContact(Contact contact) {
    _contactService.setContact(contact);
  }

  void updateFirstName(String firstname) {
    _firstName = firstname;
    notifyListeners();
  }

  void updateLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  void updateNickName(String nickName) {
    _nickName = nickName;
    notifyListeners();
  }

  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void searchContact(String query) {
    _contactService.searchContact(query);
    notifyListeners();
  }

  void updatePhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  void updateNotes(String notes) {
    _notes = notes;
    notifyListeners();
  }

  String? validateFirstname(String? firstname) {
    if(firstname != null && firstname.isNotEmpty) return null;
    return "First name is not empty";
  }

  String? validateLastname(String? lastname) {
    if(lastname != null && lastname.isNotEmpty) return null;
    return "Last name is not empty";
  }

  String? validateNickname(String? nickname) {
    if(nickname != null && nickname.isNotEmpty) return null;
    return "Nickname is not empty";
  }

  String? validatePhone(String? phone) {
    if(phone != null && phone.isNotEmpty) return null;
    return "Phone number is not empty";
  }

  String? validateEmail(String? email) {
    if(email != null && email.isNotEmpty) return null;
    return "Email is not empty";
  }
}
