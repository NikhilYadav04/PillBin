import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/strings/strings.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key,required this.ontap, required this.pageIndex, required this.pageNotifier});
    final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page3> createState() => _Page4State();
}

class _Page4State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colours.Light_Blue,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 660,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topLeft,
                    heightFactor: 0.4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Risks associated with\nDrug Disposal:",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Hanken_Bold",
                            fontSize: 40),
                      ),
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.bottomLeft,
                    heightFactor: 0.91,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "\nAntibiotic Resistance",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Hanken_Bold",
                            fontSize: 33),
                      ),
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.bottomLeft,
                    heightFactor: 0.75,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12,right: 5),
                      child: Text(
                        Strings.Risk_1,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Libre_Regular",
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            AspectRatio(
              aspectRatio: 1.1,
              child: Image.asset(Images.Image_3,)),
               SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
