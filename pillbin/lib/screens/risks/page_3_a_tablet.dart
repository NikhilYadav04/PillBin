import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/string_tablet.dart';

class Page3ATablet extends StatefulWidget {
  const Page3ATablet({super.key});

  @override
  State<Page3ATablet> createState() => _Page3ATabletState();
}

class _Page3ATabletState extends State<Page3ATablet>
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
      child: Container(
        color: Colours.Light_Blue,
        child: Column(
          children: [
            //* Risks
            Container(
              color: Colours.Light_Blue,
              height: 3.160 * SizeConfig.heightMultiplier,
            ),
            Container(
              color: Colours.Light_Blue,
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
                            child: Center(
                              child: Text(
                                "${AppLocalizations.of(context)!.page_3a_title_1} ${AppLocalizations.of(context)!.page_3a_title_2}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Hanken_Bold",
                                    fontSize:
                                        5.88 * SizeConfig.heightMultiplier),
                              ),
                            )),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: Colours.Light_Blue,
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
                            child: Center(
                              child: Text(
                                "${AppLocalizations.of(context)!.page_3a_title_3}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Hanken_Bold",
                                    fontSize:
                                        5.88 * SizeConfig.heightMultiplier),
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
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: strings.drug_risks,
                  ),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 6 * SizeConfig.heightMultiplier,
                            bottom: 2 * SizeConfig.widthMultiplier),
                        child: Image.asset(
                          Images.Image_3,
                          width: 98.75 * SizeConfig.widthMultiplier,
                          height: 62.243 * SizeConfig.heightMultiplier,
                        ),
                      ))
                ],
              ),
            )

            //* Impacts
            ,
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
                                  child: Center(
                                    child: Text(
                                      "  ${AppLocalizations.of(context)!.page_4_title_1} ${AppLocalizations.of(context)!.page_4_title_2}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Hanken_Bold",
                                          fontSize: 5.7 *
                                              SizeConfig.heightMultiplier),
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
                                  child: Center(
                                    child: Text(
                                      "${AppLocalizations.of(context)!.page_4_title_3}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Hanken_Bold",
                                          fontSize: 5.88 *
                                              SizeConfig.heightMultiplier),
                                    ),
                                  )),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0 * SizeConfig.heightMultiplier,
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
                            child: strings.impact,
                          ),
                          Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 1 * SizeConfig.heightMultiplier,
                                    bottom: 2 * SizeConfig.widthMultiplier),
                                child: Image.asset(
                                  Images.Image_4,
                                  width: 100.75 * SizeConfig.widthMultiplier,
                                  height: 64.243 * SizeConfig.heightMultiplier,
                                ),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )

            //* Effect on Marine Life
            ,
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
                                            horizontal: 4.6 *
                                                SizeConfig.widthMultiplier),
                                        child: Text(
                                          "${AppLocalizations.of(context)!.page_4a_title}",
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
                            child: strings.effect,
                          ),
                          Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    // left: 1 * SizeConfig.heightMultiplier,
                                    bottom: 2 * SizeConfig.widthMultiplier),
                                child: Image.asset(
                                  "assets/fish.png",
                                  width: 110.75 * SizeConfig.widthMultiplier,
                                  height: 66.243 * SizeConfig.heightMultiplier,
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
      ),
    );
  }
}
