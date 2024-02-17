import 'package:get_it/get_it.dart';
import 'package:simple_contact_app/services/contact_service.dart';

GetIt get locator => GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => ContactService());
}