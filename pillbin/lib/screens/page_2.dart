import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/strings/strings.dart';

class Page2 extends StatefulWidget {
  Page2({super.key,required this.ontap, required this.pageIndex, required this.pageNotifier});
    final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);
    print(screenWidth);
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 850,
          child: Stack(
            fit: StackFit.expand,
            children: [
              //* Blue Card
              FractionallySizedBox(
                heightFactor: 0.52,
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 100),
                  child: Container(
                    decoration: BoxDecoration(color: Colours.Light_Blue),
                  ),
                ),
              ),

              //*Photo
              FractionallySizedBox(
                heightFactor: 0.52,
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.only(left: 55),
                    child: Image.asset(
                      Images.Image_2,
                      scale: 1.65,
                    )),
              ),

              //*Text
              FractionallySizedBox(
                heightFactor: 0.46,
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DRUG\nDISPOSAL",
                        style: TextStyle(
                            fontFamily: "Libre_Bold",
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        Strings.Drug_1,
                        style: TextStyle(
                            letterSpacing: 1,
                            fontFamily: "Glacial_Regular",
                            fontWeight: FontWeight.w600,
                            fontSize: 19),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Text(
            Strings.Drug_2,
            style: TextStyle(
                letterSpacing: 1,
                fontFamily: "Libre_Regular",
                fontWeight: FontWeight.w400,
                fontSize: 19),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
