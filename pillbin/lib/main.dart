import 'package:flutter/material.dart';
import 'package:pillbin/screens/root_screen.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';

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
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PillBin',
          home: RootScreen());
    });
  }
}
