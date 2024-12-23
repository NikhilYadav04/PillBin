import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';

class Page7 extends StatefulWidget {
  Page7(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _positionAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _positionAnimation = Tween<double>(begin: -50, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 3.160 * SizeConfig.heightMultiplier,
          ),
          SizedBox(
            height: 53 * SizeConfig.heightMultiplier,
            child: Stack(
              fit: StackFit.expand,
              children: [
                //* Blue Card
                FractionallySizedBox(
                  heightFactor: 0.7,
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
                  heightFactor: 0.7,
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 13.167 * SizeConfig.heightMultiplier),
                      child: ClipRRect(
                        child: Image.asset(
                          Images.Image_5,
                          scale: 0.1211 * SizeConfig.heightMultiplier,
                        ),
                      )),
                ),

                //*Text
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _positionAnimation.value),
                      child: Opacity(
                        opacity: _opacityAnimation.value,
                        child: FractionallySizedBox(
                  heightFactor: 0.26,
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 2.678 * SizeConfig.widthMultiplier),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Drug Disposal\nMethods",
                          style: TextStyle(
                              fontFamily: "Libre_Bold",
                              fontWeight: FontWeight.bold,
                              fontSize: 4.213 * SizeConfig.heightMultiplier),
                        ),
                        SizedBox(
                          height: 1.580 * SizeConfig.heightMultiplier,
                        ),
                      ],
                    ),
                  ),
                )
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Flush Drugs",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 3.686 * SizeConfig.heightMultiplier),
                )),
          ),
          SizedBox(
            height: 1.580 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Medicine Disposal Guidelines",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 2.317 * SizeConfig.heightMultiplier),
                )),
          ),
          SizedBox(
            height: 0.526 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "1. Follow Healthcare Provider Instructions",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.896 * SizeConfig.heightMultiplier),
                )),
          ),
          SizedBox(
            height: 0.842 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "   Dispose of unused or expired medicines as directed by your doctor or pharmacist.",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.738 * SizeConfig.heightMultiplier,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(
            height: 2.633 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "2. Preferred Disposal Methods",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.896 * SizeConfig.heightMultiplier),
                )),
          ),
          SizedBox(
            height: 0.526 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Use a drug take-back option",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.896 * SizeConfig.heightMultiplier),
                )),
          ),
          SizedBox(
            height: 0.842 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  • Drop off medicines at an authorized take-back location\n  • Mail them using a pre-paid drug mail-back envelope.",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.685 * SizeConfig.heightMultiplier,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(
            height: 2.633 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "3. Check the FDA's Flush List",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.896 * SizeConfig.heightMultiplier),
                )),
          ),
          SizedBox(
            height: 0.526 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  " If take-back options are unavailable, verify if the medicine is on the FDA’s Flush List. Only flush medicines that:",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.738 * SizeConfig.heightMultiplier,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(
            height: 0.526 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  " • Have high misuse or abuse potential.\n • Can cause death from a single dose if improperly used..",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.738 * SizeConfig.heightMultiplier,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(
            height: 3.160 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Important Reminder",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 2.001 * SizeConfig.heightMultiplier),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Do not flush medicines unless they are explicitly listed on the FDA's Flush List.",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 2.001 * SizeConfig.heightMultiplier),
                )),
          ),
          SizedBox(
            height: 2.106 * SizeConfig.heightMultiplier,
          ),
        ],
      ),
    );
  }
}
