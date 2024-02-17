import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_contact_app/constants/app_colors.dart';
import 'package:simple_contact_app/locator.dart';
import 'package:simple_contact_app/models/contact.dart';
import 'package:simple_contact_app/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(RelationshipAdapter());
  Hive.registerAdapter(GroupAdapter());
  Hive.registerAdapter(ContactAdapter());
  await Hive.openBox('contacts');

  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        primaryColor: AppColors.primary
      ),
      title: 'Contact App',
    );
  }
}