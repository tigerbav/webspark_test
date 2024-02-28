import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webspark_test/app/presentation/screens/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      path: 'assets/locale',
      fallbackLocale: const Locale('en', 'US'),
      child: const App(),
    ),
  );
}
