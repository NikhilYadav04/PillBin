import 'package:flutter/material.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings.dart';

import '../styling/colors/colors.dart';

class Page4B extends StatefulWidget {
  Page4B(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page4B> createState() => _Page4BState();
}

class _Page4BState extends State<Page4B> with SingleTickerProviderStateMixin {
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
    final strings = Strings(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colours.Very_Light_Blue,
            height: 3.160 * SizeConfig.heightMultiplier,
          ),
          Container(
            height: 125,
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
                        child: FractionallySizedBox(
                          alignment: Alignment.topLeft,
                          heightFactor: 0.4,
                          child: Center(
                            child: Text(
                              "Survey on Drug",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Hanken_Bold",
                                  fontSize: 4.1 * SizeConfig.heightMultiplier),
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
                          alignment: Alignment.topLeft,
                          heightFactor: 1.25,
                          child: Center(
                            child: Text(
                              "Disposal Awareness",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Hanken_Bold",
                                  fontSize: 4.1 * SizeConfig.heightMultiplier),
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
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 2.678 * SizeConfig.widthMultiplier),
            child: Column(
              children: [
                SizedBox(
                  height: 1 * SizeConfig.heightMultiplier,
                ),
                strings.survey,
                SizedBox(
                  height: 3 * SizeConfig.heightMultiplier,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Center(
                  child: Text(
                    strings.survey_2,
                    style: style.copyWith(color: Colors.black, fontSize: 17),
                  ),
                ),
                SizedBox(
                  height: 2 * SizeConfig.heightMultiplier,
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/survey.png",
            height: 415,
            width: 415,
          ),
          SizedBox(
            height: 3 * SizeConfig.heightMultiplier,
          ),
        ],
      ),
    );
  }
}
