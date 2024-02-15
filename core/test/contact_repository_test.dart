import 'package:core/common/result.dart';
import 'package:core/data/data_source/local_storage_data_source.dart';
import 'package:core/data/model/contact.dart';
import 'package:core/data/repository/contact_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'mocks.dart';

void main() async {
  late ContactRepository repository;

  // Mock the LocalStorageDataSource data source
  late MockLocalStorageDataSource mockLocalStorageDataSource;

  setUp(() {
    mockLocalStorageDataSource = MockLocalStorageDataSource();
    repository = ContactRepository(mockLocalStorageDataSource);
  });

  // Mock data for contact 1
  Contact mockContact1 = Contact(
    firstname: 'John',
    lastname: 'Doe',
    phone: '123-456-7890',
    email: 'john.doe@example.com',
    nickname: 'JD',
    notes: 'Some notes about John',
  );

  // Mock data for contact 2
  Contact mockContact2 = Contact(
    firstname: 'Michel',
    lastname: 'Yovo',
    phone: '987-654-3210',
    email: 'email@gmail.com',
    nickname: 'TFL',
    groups: [Group.Family],
    notes: 'The Youngest of the fam!',
    relationship: Relationship.Brother,
  );

  List<Contact> contactList = <Contact>[
    mockContact1,
    mockContact2
  ];

  group("getContactList Tests", () {
    test('returns a Result with List<Contact>', () async {
      when(() => mockLocalStorageDataSource.getContactList())
          .thenAnswer((_) async => Success(contactList));

      final result = await repository.getContactList();

      expect(result, isA<Success>());
      expect((result as Success).data, contactList);

      verify(() => mockLocalStorageDataSource.getContactList());
      verifyNoMoreInteractions(mockLocalStorageDataSource);
    });

    test('returns an error when data is empty', () async {
      when(() => mockLocalStorageDataSource.getContactList())
          .thenAnswer((_) async => LocalStorageErrorType.noData.toFailure());

      final result = await repository.getContactList();

      expect(result, isA<Failure>());
      expect((result as Failure).type, LocalStorageErrorType.noData);
    });

    test('returns an error when something is wrong with isar', () async {
      when(() => mockLocalStorageDataSource.getContactList())
          .thenAnswer((_) async => LocalStorageErrorType.noData.toFailure());

      final result = await repository.getContactList();

      expect(result, isA<Failure>());
      expect((result as Failure).type, LocalStorageErrorType.noData);

      verify(() => mockLocalStorageDataSource.getContactList());
      verifyNoMoreInteractions(mockLocalStorageDataSource);
    });
  });

  test('addContact should not throw an exception', () async {

    when(() => mockLocalStorageDataSource.addContact(firstname: mockContact1.firstname))
        .thenAnswer((_) async {});

    expect(() async => await repository.addContact(firstname: mockContact1.firstname), returnsNormally);

    verify(() => mockLocalStorageDataSource.addContact(firstname: mockContact1.firstname));
    verifyNoMoreInteractions(mockLocalStorageDataSource);
  });

  test('updateContact should not throw an exception', () async {
    final id = 1;

    when(() => mockLocalStorageDataSource.updateContact(id))
        .thenAnswer((_) async => Future.value());

    expect(() async => await repository.updateContact(id), returnsNormally);

    verify(() => mockLocalStorageDataSource.updateContact(id));
    verifyNoMoreInteractions(mockLocalStorageDataSource);
  });

  test('deleteContact should not throw an exception', () async {
    final id = 1;

    when(() => mockLocalStorageDataSource.deleteContact(id))
        .thenAnswer((_) async => Future.value());

    expect(() async => await repository.deleteContact(id), returnsNormally);

    verify(() => mockLocalStorageDataSource.deleteContact(id));
    verifyNoMoreInteractions(mockLocalStorageDataSource);
  });
}