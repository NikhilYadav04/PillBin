import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pillbin/styling/strings/string_tablet.dart';

class Page5Tablet extends StatefulWidget {
  const Page5Tablet({super.key});

  @override
  State<Page5Tablet> createState() => _Page5TabletState();
}

class _Page5TabletState extends State<Page5Tablet>
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
    final strings = StringsTablet(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colours.Very_Light_Blue,
            height: 3.160 * SizeConfig.heightMultiplier,
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
                                    horizontal: 5 * SizeConfig.widthMultiplier),
                                child: Text(
                                  "${AppLocalizations.of(context)!.page_5_title_1} ${AppLocalizations.of(context)!.page_5_title_2}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Hanken_Bold",
                                      fontSize:
                                          6 * SizeConfig.heightMultiplier),
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
                                        4.6 * SizeConfig.widthMultiplier),
                                child: Text(
                                  "${AppLocalizations.of(context)!.page_5_title_3} ${AppLocalizations.of(context)!.page_5_title_4}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Hanken_Bold",
                                      fontSize:
                                          6 * SizeConfig.heightMultiplier),
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
          SizedBox(height: 6* SizeConfig.heightMultiplier,),
          Padding(
            padding:EdgeInsets.only(left: 7*SizeConfig.heightMultiplier),
            child: Row(
              children: [
                Card(strings.rules_strict[0], strings.rules_desc[0],9),
                SizedBox(
                  width: 2.678 * SizeConfig.widthMultiplier,
                ),
                Card(strings.rules_strict[1], strings.rules_desc[1],9),
                SizedBox(
                  width: 2.678 * SizeConfig.widthMultiplier,
                ),
                Card(strings.rules_strict[2], strings.rules_desc[2],9),
                SizedBox(
                  width: 2.678 * SizeConfig.widthMultiplier,
                ),
                Card(strings.rules_strict[3], strings.rules_desc[3],9),
                SizedBox(
                  width: 2.678 * SizeConfig.widthMultiplier,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget Card(String title, String desc,int maxLines) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: 1.785 * SizeConfig.widthMultiplier,
            vertical: 1.6 * SizeConfig.heightMultiplier),
        height: 55.00 * SizeConfig.heightMultiplier,
        width: 21 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(1.474 * SizeConfig.heightMultiplier),
            color: Colours.Light_Blue),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Hanken_Bold",
                  fontSize: 3.3 * SizeConfig.heightMultiplier,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2 * SizeConfig.heightMultiplier,
            ),
            Text(
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              desc,
              style: TextStyle(
                  color: Colors.grey.shade900,
                  fontFamily: "Libre_Regular",
                  fontSize: 2.3* SizeConfig.heightMultiplier,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      SizedBox(
        height: 1.580 * SizeConfig.heightMultiplier,
      )
    ],
  );
}
