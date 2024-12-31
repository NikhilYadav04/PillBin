import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings.dart';

class Page4A extends StatefulWidget {
  Page4A(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page4A> createState() => _Page4AState();
}

class _Page4AState extends State<Page4A> with SingleTickerProviderStateMixin {
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
            height: 7.373 * SizeConfig.heightMultiplier,
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
                          heightFactor: 0.6,
                          child: Center(
                            child: Text(
                              strings.page_4a_title,
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
            color: Colours.Very_Light_Blue,
            padding: EdgeInsets.symmetric(
                horizontal: 2.678 * SizeConfig.widthMultiplier),
            child: Column(
              children: [
                SizedBox(
                  height: 1.2 * SizeConfig.heightMultiplier,
                ),
                strings.effect,
              ],
            ),
          ),
           Image.asset(
                  "assets/fish.png",
                  height: 43.028*SizeConfig.heightMultiplier,
                  width: 85.821*SizeConfig.widthMultiplier,
                ),
                  SizedBox(
                    height:2.4 * SizeConfig.heightMultiplier,
                  ),
        ],
      ),
    );
  }
}
