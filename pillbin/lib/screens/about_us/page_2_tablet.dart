import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings_2.dart';

class Page2Tablet extends StatefulWidget {
  const Page2Tablet({super.key});

  @override
  State<Page2Tablet> createState() => _Page2TabletState();
}

class _Page2TabletState extends State<Page2Tablet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _positionAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    final Strings2 strings = Strings2(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 9.480 * SizeConfig.heightMultiplier,
            color: Colours.Very_Light_Blue,
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
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Center(
                              child: Text(
                                strings.page_2_title,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Hanken_Bold",
                                    fontSize:
                                        7.4 * SizeConfig.heightMultiplier),
                              ),
                            ),
                          )),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5*SizeConfig.heightMultiplier,
                horizontal: 5.8 * SizeConfig.widthMultiplier),
            child: Center(
              child: Text(
                strings.page_2_desc,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Hanken_Bold",
                    fontSize: 3.9 * SizeConfig.heightMultiplier),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
