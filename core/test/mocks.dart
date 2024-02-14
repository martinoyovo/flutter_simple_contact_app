import 'package:core/data/data_source/local_storage_data_source.dart';
import 'package:core/data/repository/contact_repository.dart';
import 'package:mocktail/mocktail.dart';


class MockContactRepository extends Mock implements ContactRepository {}
class MockLocalStorageDataSource extends Mock implements LocalStorageDataSource {}

