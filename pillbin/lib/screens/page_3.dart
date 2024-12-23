import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings.dart';

class Page3 extends StatefulWidget {
  Page3(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _positionAnimation;

  @override
  void initState() {
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colours.Light_Blue,
        child: Column(
          children: [
            SizedBox(
              height: 1 * SizeConfig.heightMultiplier,
            ),
            SizedBox(
              height: 16.522 * SizeConfig.heightMultiplier,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _positionAnimation.value),
                        child: Opacity(
                          opacity: _opacityAnimation.value,
                          child: FractionallySizedBox(
                            alignment: Alignment.topLeft,
                            heightFactor: 0.7,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      2.678 * SizeConfig.widthMultiplier),
                              child: Text(
                                "Risks associated with\nDrug Disposal:",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Hanken_Bold",
                                    fontSize:
                                        4.213 * SizeConfig.heightMultiplier),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _positionAnimation.value),
                        child: Opacity(
                          opacity: _opacityAnimation.value,
                          child: FractionallySizedBox(
                            alignment: Alignment.bottomLeft,
                            heightFactor: 0.58,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      2.678 * SizeConfig.widthMultiplier),
                              child: Text(
                                "\nAntibiotic Resistance",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Hanken_Bold",
                                    fontSize:
                                        3.476 * SizeConfig.heightMultiplier),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.160 * SizeConfig.heightMultiplier,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 1.264 * SizeConfig.heightMultiplier,
                  right: 0.526 * SizeConfig.heightMultiplier),
              child: Text(
                Strings.Risk_1,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Libre_Regular",
                    fontSize: 2.106 * SizeConfig.heightMultiplier),
              ),
            ),
            SizedBox(
              height: 3.160 * SizeConfig.heightMultiplier,
            ),
            AspectRatio(
                aspectRatio: 1.1,
                child: Image.asset(
                  Images.Image_3,
                )),
            SizedBox(
              height: 3.160 * SizeConfig.heightMultiplier,
            ),
          ],
        ),
      ),
    );
  }
}
