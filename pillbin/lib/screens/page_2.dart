import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings.dart';

class Page2 extends StatefulWidget {
  Page2(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("height is ${SizeConfig.heightMultiplier}");
    print("width is ${SizeConfig.widthMultiplier}");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);
    print(screenWidth);
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height:48.536 * SizeConfig.heightMultiplier,
          child: Stack(
            fit: StackFit.expand,
            children: [
              //* Blue Card
              FractionallySizedBox(
                heightFactor: 0.95,
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 1.580 * SizeConfig.heightMultiplier,
                      right: 10.534 * SizeConfig.heightMultiplier),
                  child: Container(
                    decoration: BoxDecoration(color: Colours.Light_Blue),
                  ),
                ),
              ),

              //*Photo
              FractionallySizedBox(
                heightFactor: 1.05,
                alignment: Alignment.bottomLeft,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 5.793 * SizeConfig.heightMultiplier),
                    child: Image.asset(
                      Images.Image_2,
                      scale: 0.356 * SizeConfig.widthMultiplier,
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 0,
        ),
         SizedBox(height: 1.053*SizeConfig.heightMultiplier,),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 2.678 * SizeConfig.widthMultiplier),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "DRUG\nDISPOSAL",
                style: TextStyle(
                    fontFamily: "Libre_Bold",
                    fontWeight: FontWeight.bold,
                    fontSize: 4.213 * SizeConfig.heightMultiplier),
              ),
              SizedBox(
                height: 1.580 * SizeConfig.heightMultiplier,
              ),
              Text(
                Strings.Drug_1,
                style: TextStyle(
                    letterSpacing: 1,
                    fontFamily: "Glacial_Regular",
                    fontWeight: FontWeight.w600,
                    fontSize: 2.001 * SizeConfig.heightMultiplier),
              ),
            ],
          ),
        ),
        SizedBox(height: 1.053*SizeConfig.heightMultiplier,),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 2.678 * SizeConfig.widthMultiplier,
              vertical: 1.053 * SizeConfig.heightMultiplier),
          child: Text(
            Strings.Drug_2,
            style: TextStyle(
                letterSpacing: 1,
                fontFamily: "Libre_Regular",
                fontWeight: FontWeight.w400,
                fontSize: 2.001 * SizeConfig.heightMultiplier),
          ),
        ),
        SizedBox(
          height: 2.106 * SizeConfig.heightMultiplier,
        ),
      ]),
    );
  }
}
