import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillbin/l10n/l10n.dart';
import 'package:pillbin/screens/root_screen/root_screen.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings_2.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);
      return GetMaterialApp(
          supportedLocales: L10n.all,
          locale: Strings2.app_locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          title: 'PillBin',
          home: RootScreen());
    });
  }
}
