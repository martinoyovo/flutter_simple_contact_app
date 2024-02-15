import 'package:core/common/result.dart';
import 'package:core/data/data_source/local_storage_data_source.dart';
import 'package:core/data/model/contact.dart';
import 'package:core/domain/usecase/contact_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'mocks.dart';

void main() {
  late ContactUseCase useCase;

  // Mock the Contact repository
  late MockContactRepository mockRepository;

  setUp(() {
    mockRepository = MockContactRepository();

    useCase = ContactUseCase(
      mockRepository
    );

  });

  group('Contact usecase tests', () {
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
      test('returns a list of contacts on success', () async {
        final expectedContacts = contactList;
        when(() => mockRepository.getContactList())
            .thenAnswer((_) async => Success(expectedContacts));

        final result = await useCase.getContactList();

        expect(result, isA<Success>());
        expect((result as Success).data, expectedContacts);
      });

      test('returns failure on repository failure while getting contacts', () async {
        when(() => mockRepository.getContactList())
            .thenAnswer((_) async => LocalStorageErrorType.isarError.toFailure());

        final result = await useCase.getContactList();

        expect(result, isA<Failure>());
        expect((result as Failure).type, LocalStorageErrorType.isarError);
      });
    });

    group('addContact Tests', () {
      test('returns success on adding contact', () async {
        when(() => mockRepository.addContact(firstname: mockContact1.firstname,)).thenAnswer((_) async {});

        final result = await useCase.addContact(
          firstname: mockContact1.firstname,
        );

        expect(result, isA<Success>());
        expect((result as Success).data, isTrue);
      });

      test('returns failure on empty fields', () async {
        final result = await useCase.addContact();

        expect(result, isA<Failure>());
        expect((result as Failure).type, AddContactErrorType.emptyFields);
      });
    });

    group('updateContact Tests', () {
      Contact existingContact = Contact(
        firstname: 'John',
        lastname: 'Doe',
        phone: '123-456-7890',
        email: 'john.doe@example.com',
        nickname: 'JD',
        notes: 'Some notes about John',
        groups: [Group.Colleagues],
        relationship: Relationship.Friend,
      );

      test('update contact successfully when first name has changed', () async {
        final id = 1;
        final updatedFirstName = 'George';

        when(() => mockRepository.getContactById(id))
            .thenAnswer((_) async => Success(existingContact));

        when(() => mockRepository.updateContact(id,
          firstname: updatedFirstName,
        )).thenAnswer((_) async {});

        final result = await useCase.updateContact(
          id,
          firstname: updatedFirstName,
        );

        // Assert
        expect(result, isA<Success>());
        expect((result as Success).data, true);

        verify(() => mockRepository.getContactById(id)).called(1);
        verify(() => mockRepository.updateContact(id, firstname: updatedFirstName,)).called(1);
        verifyNoMoreInteractions(mockRepository);
      });

      test('returns UpdateContactErrorType.noContact when contact does not exist', () async {
        final id = 2;
        when(() => mockRepository.getContactById(id))
            .thenAnswer((_) async => Success(null));

        final result = await useCase.updateContact(id);

        expect(result, isA<Failure>());
        expect((result as Failure).type, UpdateContactErrorType.noContact);

        verify(() => mockRepository.getContactById(id)).called(1);
        verifyNever(() => mockRepository.updateContact(id));
        verifyNoMoreInteractions(mockRepository);
      });

      test('returns UpdateContactErrorType.general when repository call fails', () async {
        // Arrange
        final id = 3;
        when(() => mockRepository.getContactById(id))
            .thenAnswer((_) async => Failure(LocalStorageErrorType.isarError));

        final result = await useCase.updateContact(id);

        expect(result, isA<Failure>());
        expect((result as Failure).type, UpdateContactErrorType.general);

        verify(() => mockRepository.getContactById(id)).called(1);
        verifyNever(() => mockRepository.updateContact(id));
        verifyNoMoreInteractions(mockRepository);
      });
    });

    test('deleteContact should not throw an exception', () async {
      final id = 1;

      when(() => mockRepository.deleteContact(id))
          .thenAnswer((_) async => Future.value());

      expect(() async => await useCase.deleteContact(id), returnsNormally);

      verify(() => mockRepository.deleteContact(id));
      verifyNoMoreInteractions(mockRepository);
    });

    group('filteredContactList Tests', () {

      final searchedContacts = [mockContact1];

      test('returns a list of contacts after searching', () async {
        final query = 'Joh';

        when(() => mockRepository.getContactList())
            .thenAnswer((_) async => Success(searchedContacts));

        final result = await useCase.filteredContactList(query);

        expect(result, isA<Success>());
        expect((result as Success).data, searchedContacts);
      });

      test('returns failure when no contact has been found for the query', () async {
        final query = 'Tino';

        when(() => mockRepository.getContactList())
            .thenAnswer((_) async => Success(searchedContacts));

        final result = await useCase.filteredContactList(query);

        expect(result, isA<Failure>());
        expect((result as Failure).type, SearchContactErrorType.emptySearchList);
      });


      test('returns failure when there\'s no contact', () async {
        final query = 'Tino';

        when(() => mockRepository.getContactList())
            .thenAnswer((_) async => LocalStorageErrorType.noData.toFailure());

        final result = await useCase.filteredContactList(query);

        expect(result, isA<Failure>());
        expect((result as Failure).type, SearchContactErrorType.isarError);
      });

      test('returns failure when there\'s a db error', () async {
        final query = 'Tino';
        when(() => mockRepository.getContactList())
            .thenAnswer((_) async => LocalStorageErrorType.isarError.toFailure());

        final result = await useCase.filteredContactList(query);

        expect(result, isA<Failure>());
        expect((result as Failure).type, SearchContactErrorType.isarError);
      });
    });
  });
}