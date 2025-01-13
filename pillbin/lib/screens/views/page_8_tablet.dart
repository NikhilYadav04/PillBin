import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings2_tablet.dart';

class Page8Tablet extends StatefulWidget {
  const Page8Tablet({super.key});

  @override
  State<Page8Tablet> createState() => _Page8TabletState();
}

class _Page8TabletState extends State<Page8Tablet>
    with SingleTickerProviderStateMixin {
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
    final strings = Strings2Tablet(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colours.Very_Light_Blue,
            height: 2.6 * SizeConfig.heightMultiplier,
          ),
          Container(
            color: Colours.Very_Light_Blue,
            height: 8.323 * SizeConfig.heightMultiplier,
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
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        3.5 * SizeConfig.widthMultiplier),
                                child: FittedBox(
                                  child: Text(
                                    "${AppLocalizations.of(context)!.page_8a_title_1} ${AppLocalizations.of(context)!.page_8a_title_2} ${AppLocalizations.of(context)!.page_8a_title_3}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Hanken_Bold",
                                        fontSize:
                                            4.2 * SizeConfig.heightMultiplier),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.1 * SizeConfig.widthMultiplier),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1, child: _review(strings.view_student_1, 62.5*SizeConfig.heightMultiplier)),
                Expanded(flex: 1, child: _review(strings.view_student_2, 62.5*SizeConfig.heightMultiplier)),
                Expanded(flex: 1, child: _review(strings.view_student_3, 62.5*SizeConfig.heightMultiplier)),
              ],
            ),
          ),
          SizedBox(
            height: 2 * SizeConfig.heightMultiplier,
          ),
          Container(
            color: Colours.Very_Light_Blue,
            height: 2.6 * SizeConfig.heightMultiplier,
          ),
          Container(
            color: Colours.Very_Light_Blue,
            height: 8.323 * SizeConfig.heightMultiplier,
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
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        3.5 * SizeConfig.widthMultiplier),
                                child: FittedBox(
                                  child: Text(
                                    "${AppLocalizations.of(context)!.page_8b_title_1} ${AppLocalizations.of(context)!.page_8b_title_2} ${AppLocalizations.of(context)!.page_8b_title_3}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Hanken_Bold",
                                        fontSize:
                                            4.2 * SizeConfig.heightMultiplier),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.1 * SizeConfig.widthMultiplier),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1, child: _review(strings.view_doctor_1, 31.914*SizeConfig.heightMultiplier)),
                Expanded(flex: 1, child: _review(strings.view_doctor_2,31.914*SizeConfig.heightMultiplier)),
                Expanded(flex: 1, child: _review(strings.view_doctor_3, 31.914*SizeConfig.heightMultiplier)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _review(String text, double height) {
  return Container(
    decoration: BoxDecoration(
        // border: Border.all(color: Colors.black)
        ),
    height: height,
    width: 392.96,
    padding:
        EdgeInsets.symmetric(horizontal: 1.40625 * SizeConfig.widthMultiplier),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 1.5625 * SizeConfig.widthMultiplier),
          child: Image.asset(
            Images.Comma,
            height: 4.68758 * SizeConfig.widthMultiplier,
            width: 7.97872 * SizeConfig.heightMultiplier,
          ),
        ),
        Text(
            maxLines: 14,
            overflow: TextOverflow.ellipsis,
            text,
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 2.4 * SizeConfig.heightMultiplier,
                fontFamily: "Hanken_Medium")),
      ],
    ),
  );
}
