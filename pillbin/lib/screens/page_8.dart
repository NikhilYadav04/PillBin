import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';

class Page8 extends StatefulWidget {
  Page8(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page8> createState() => _Page8State();
}

class _Page8State extends State<Page8> with SingleTickerProviderStateMixin {
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
            height: 48.455 * SizeConfig.heightMultiplier,
            child: Stack(
              fit: StackFit.expand,
              children: [
                //* Blue Card
                FractionallySizedBox(
                  heightFactor: 0.82,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 1.580 * SizeConfig.heightMultiplier,
                        right: 10.533 * SizeConfig.heightMultiplier),
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
                      padding: EdgeInsets.only(
                          left: 9 * SizeConfig.heightMultiplier),
                      child: ClipRRect(
                        child: Image.asset(
                          Images.Image_6,
                          scale: 0.14 * SizeConfig.heightMultiplier,
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
                            heightFactor: 0.13,
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      3.125 * SizeConfig.widthMultiplier),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Non Flush Drugs",
                                    style: TextStyle(
                                        fontFamily: "Libre_Bold",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 3.792 *
                                            SizeConfig.heightMultiplier),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 1.053 * SizeConfig.heightMultiplier),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "If drug take-back options are unavailable, dispose of most medicines at home by:",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 2.054 * SizeConfig.heightMultiplier,
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
                  "  1. Removing them from their original containers.",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 2.054 * SizeConfig.heightMultiplier,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(
            height: 1.053 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  2. Mixing them with an unappealing substance like dirt, cat litter, or coffee grounds (without crushing tablets/capsules).",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 2.054 * SizeConfig.heightMultiplier,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(
            height: 1.053 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  3. Placing the mixture in a sealed plastic bag.",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 2.054 * SizeConfig.heightMultiplier,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(
            height: 1.053 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  4. Throwing the sealed bag in your household trash.",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 2.054 * SizeConfig.heightMultiplier,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(
            height: 1.053 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  5. Scratching out personal information on prescription labels before  throwing the empty containers.",
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 2.054 * SizeConfig.heightMultiplier,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(
            height: 3.160 * SizeConfig.heightMultiplier,
          ),
        ],
      ),
    );
  }
}
