import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';

class Page8 extends StatefulWidget {
  const Page8({super.key,required this.ontap, required this.pageIndex, required this.pageNotifier});
    final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page8> createState() => _Page8State();
}

class _Page8State extends State<Page8> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 460,
            child: Stack(
              fit: StackFit.expand,
              children: [
                //* Blue Card
                FractionallySizedBox(
                  heightFactor: 0.82,
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
                  heightFactor: 0.81,
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 115),
                      child: ClipRRect(
                        child: Image.asset(
                          Images.Image_6,
                          scale: 1.3,
                        ),
                      )),
                ),

                //*Text
                FractionallySizedBox(
                  heightFactor: 0.13,
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Non Flush Drugs",
                          style: TextStyle(
                              fontFamily: "Libre_Bold",
                              fontWeight: FontWeight.bold,
                              fontSize: 36),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "If drug take-back options are unavailable, dispose of most medicines at home by:",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 19.5,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(height: 25,),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  1. Removing them from their original containers.",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 19.5,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(height: 10,),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  2. Mixing them with an unappealing substance like dirt, cat litter, or coffee grounds (without crushing tablets/capsules).",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 19.5,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(height: 10,),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  3. Placing the mixture in a sealed plastic bag.",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 19.5,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(height: 10,),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  4. Throwing the sealed bag in your household trash.",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 19.5,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(height: 10,),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  5. Scratching out personal information on prescription labels before  throwing the empty containers.",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 19.5,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}
