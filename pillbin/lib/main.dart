import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:pillbin/helper/keys.dart';
import 'package:pillbin/l10n/l10n.dart';
import 'package:pillbin/screens/root_screen/root_screen.dart';
import 'package:pillbin/screens/root_screen/root_screen_tablet.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings_2.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Gemini.init(
    apiKey: Keys.apiKey,
  );

  //* initialize dotenv
  await dotenv.load();
  

  // Set preferred orientation globally for tablets
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  //runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);

      //* Determine if the device is a tablet
      bool isTablet = SizeConfig.screenWidth > 600;

      if (isTablet) {
        //* Lock orientation to landscape for tablets
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        //* Allow portrait mode for non-tablets
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }

      return GetMaterialApp(
        theme: ThemeData(primaryColor: Colors.blue, fontFamily: "Glacial_Bold"),
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
        home: isTablet ? RootScreenTablet() : RootScreen(),
      );
    });
  }
}
