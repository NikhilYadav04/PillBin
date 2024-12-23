import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pillbin/screens/root_screen.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
 //runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PillBin App',
          home: RootScreen());
    });
  }
}
