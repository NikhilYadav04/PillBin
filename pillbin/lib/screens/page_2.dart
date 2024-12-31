import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings_2.dart';

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
    final Strings2 strings = Strings2(context);
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          color: Colours.Very_Light_Blue,
          height: 1 * SizeConfig.heightMultiplier,
        ),
        Container(
          height: 9.480*SizeConfig.heightMultiplier,
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
                        heightFactor: 0.8,
                        child: Center(
                          child: Text(
                            strings.page_2_title,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Hanken_Bold",
                                fontSize: 4.6 * SizeConfig.heightMultiplier),
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.25*SizeConfig.widthMultiplier),
          child: Center(
            child: Text(
              strings.page_2_desc,
              style: TextStyle(
                  color: Colors.black, fontFamily: "Hanken_Bold", fontSize:2.528*SizeConfig.heightMultiplier),
            ),
          ),
        ),
        SizedBox(
          height: 2.633*SizeConfig.heightMultiplier,
        ),
      ]),
    );
  }
}
