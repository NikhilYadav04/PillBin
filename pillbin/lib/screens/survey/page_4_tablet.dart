import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/string_tablet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Page4Tablet extends StatefulWidget {
  const Page4Tablet({super.key});

  @override
  State<Page4Tablet> createState() => _Page4TabletState();
}

class _Page4TabletState extends State<Page4Tablet>
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
          //* Survey
          Container(
            color: Colours.Very_Light_Blue,
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
                                          horizontal:
                                              4.6 * SizeConfig.widthMultiplier),
                                      child: Text(
                                        "${AppLocalizations.of(context)!.page_4b_title_1} ${AppLocalizations.of(context)!.page_4b_title_2}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Hanken_Bold",
                                            fontSize: 6 *
                                                SizeConfig.heightMultiplier),
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
                      horizontal: 2 * SizeConfig.widthMultiplier),
                  child: Container(
                    color: Colours.Very_Light_Blue,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              strings.survey,
                              SizedBox(
                                height: 4* SizeConfig.heightMultiplier,
                              ),
                              Center(
                                child: Text(
                                  strings.survey_2,
                                  style: style.copyWith(
                                      color: Colors.black,
                                      fontSize:
                                          2.5 * SizeConfig.heightMultiplier),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  // left: 1 * SizeConfig.heightMultiplier,
                                  bottom: 2 * SizeConfig.widthMultiplier),
                              child: Image.asset(
                                Images.Survey,
                                width: 110.75 * SizeConfig.widthMultiplier,
                                height: 60.243 * SizeConfig.heightMultiplier,
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
