// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:pillbin/controller/GetX_dropdown.dart';
import 'package:pillbin/styling/colors/colors.dart';

import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';

// ignore: must_be_immutable
class Page1Tablet extends StatefulWidget {
  void Function() onTap;
  Page1Tablet({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Page1Tablet> createState() => _Page1TabletState();
}

class _Page1TabletState extends State<Page1Tablet>
    with SingleTickerProviderStateMixin {
  final DropDownController _dropDownController = Get.put(DropDownController());
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _positionAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        //*Image
        FractionallySizedBox(
          alignment: Alignment.topCenter,
          widthFactor: 1,
          child: Image.asset(
            "assets/bg1.png",
            fit: BoxFit.fill,
          ),
        ),

        //* Card
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _positionAnimation.value),
              child: Opacity(
                  opacity: _opacityAnimation.value,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 9 * SizeConfig.heightMultiplier,
                          bottom: 2.8 * SizeConfig.widthMultiplier),
                      height: 45.77 * SizeConfig.heightMultiplier,
                      width: 52.85 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(
                            1.5 * SizeConfig.heightMultiplier),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.580 * SizeConfig.widthMultiplier),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5 * SizeConfig.heightMultiplier,
                            ),
                            FittedBox(
                              child: Text(
                                // maxLines: 1,
                                // overflow: TextOverflow.ellipsis,
                                AppLocalizations.of(context)!
                                    .page_1_header_1_tablet,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Hanken_Medium",
                                    fontSize: 7.8 * SizeConfig.heightMultiplier),
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                // maxLines: 1,
                                // overflow: TextOverflow.ellipsis,
                                AppLocalizations.of(context)!
                                    .page_1_header_2_tablet,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Hanken_Bold",
                                    fontSize: 7.8 * SizeConfig.heightMultiplier),
                              ),
                            ),
                            SizedBox(
                              height: 5.5 * SizeConfig.heightMultiplier,
                            ),
                            Row(
                              children: [
                                Button(
                                    widget.onTap,
                                    AppLocalizations.of(context)!
                                        .page_1_button),
                                SizedBox(
                                  width: 2 * SizeConfig.widthMultiplier,
                                ),
                                Button(() {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor:
                                              Colours.Very_Light_Blue,
                                          content: Container(
                                            width: 19.531 *
                                                SizeConfig.widthMultiplier,
                                            height: 29.255 *
                                                SizeConfig.heightMultiplier,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                color: Colours.Very_Light_Blue),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2 *
                                                      SizeConfig
                                                          .heightMultiplier),
                                              child: Column(
                                                children: [
                                                  _text("English", () {
                                                    _dropDownController
                                                        .setLanguage("en");
                                                  }),
                                                  SizedBox(
                                                    height: 1.85 *
                                                        SizeConfig
                                                            .heightMultiplier,
                                                  ),
                                                  _text("हिन्दी", () {
                                                    _dropDownController
                                                        .setLanguage("hi");
                                                  }),
                                                  SizedBox(
                                                    height: 1.7*
                                                        SizeConfig
                                                            .heightMultiplier,
                                                  ),
                                                  _text("मराठी", () {
                                                    _dropDownController
                                                        .setLanguage("mr");
                                                  }),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                }, "Change Language"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            );
          },
        ),
      ],
    );
  }

  Widget Button(void Function() onTap, String text) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 8.2 * SizeConfig.heightMultiplier,
        width: 17.571 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(4.160 * SizeConfig.heightMultiplier),
          color: const Color.fromARGB(255, 235, 229, 229),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              maxLines: 1,
              text,
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Hanken_Medium",
                fontSize: 2.8 * SizeConfig.heightMultiplier,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _text(String text, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 5 * SizeConfig.heightMultiplier,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade800,
            fontFamily: "Libre_Regular"),
      ),
    );
  }
}
