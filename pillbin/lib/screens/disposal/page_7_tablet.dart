import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings2_tablet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Page7Tablet extends StatefulWidget {
  const Page7Tablet({super.key});

  @override
  State<Page7Tablet> createState() => _Page7TabletState();
}

class _Page7TabletState extends State<Page7Tablet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _positionAnimation;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

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
    final Strings2Tablet strings = Strings2Tablet(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          //* Flush Drugs
          Row(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 84.536 * SizeConfig.heightMultiplier,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      //* Blue Card
                      Padding(
                        padding: EdgeInsets.only(
                            right: 14 * SizeConfig.heightMultiplier),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: double.infinity,
                            decoration:
                                BoxDecoration(color: Colours.Light_Blue),
                          ),
                        ),
                      ),

                      //* Photo
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 4 * SizeConfig.widthMultiplier,
                                left: 5.793 * SizeConfig.heightMultiplier),
                            child: Image.asset(
                              Images.Image_5_1,
                              scale: 0.07 * SizeConfig.widthMultiplier,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 2.6 * SizeConfig.widthMultiplier),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 3 * SizeConfig.heightMultiplier,
                      ),
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, _positionAnimation.value),
                            child: Opacity(
                                opacity: _opacityAnimation.value,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    strings.page_7_title_1,
                                    style: TextStyle(
                                        fontFamily: "Libre_Bold",
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            6 * SizeConfig.heightMultiplier),
                                  ),
                                )),
                          );
                        },
                      ),
                      SizedBox(
                        height: 1.8 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0 * SizeConfig.widthMultiplier),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.page_7_text_1,
                              style: TextStyle(
                                  fontFamily: "Libre_Regular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 4.5 * SizeConfig.heightMultiplier),
                            )),
                      ),
                      SizedBox(
                        height: 1.580 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0 * SizeConfig.widthMultiplier),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.page_7_text_2,
                              style: TextStyle(
                                  fontFamily: "Libre_Regular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 3 * SizeConfig.heightMultiplier),
                            )),
                      ),
                      SizedBox(
                        height: 0.526 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0 * SizeConfig.widthMultiplier),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.page_7_text_3,
                              style: TextStyle(
                                  fontFamily: "Libre_Regular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2.8 * SizeConfig.heightMultiplier),
                            )),
                      ),
                      SizedBox(
                        height: 0.842 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0 * SizeConfig.widthMultiplier),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.page_7_text_4,
                              style: TextStyle(
                                  fontFamily: "Libre_Regular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2.4 * SizeConfig.heightMultiplier,
                                  color: Color.fromARGB(255, 78, 76, 76)),
                            )),
                      ),
                      SizedBox(
                        height: 2.633 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0 * SizeConfig.widthMultiplier),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.page_7_text_5,
                              style: TextStyle(
                                  fontFamily: "Libre_Regular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2.8 * SizeConfig.heightMultiplier),
                            )),
                      ),
                      SizedBox(
                        height: 0.526 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0 * SizeConfig.widthMultiplier),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.page_7_text_6,
                              style: TextStyle(
                                  fontFamily: "Libre_Regular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2.6 * SizeConfig.heightMultiplier),
                            )),
                      ),
                      SizedBox(
                        height: 0.842 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0 * SizeConfig.widthMultiplier),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.page_7_text_7,
                              style: TextStyle(
                                  fontFamily: "Libre_Regular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2.4 * SizeConfig.heightMultiplier,
                                  color: Color.fromARGB(255, 78, 76, 76)),
                            )),
                      ),
                      SizedBox(
                        height: 2.633 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0 * SizeConfig.widthMultiplier),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.page_7_text_8,
                              style: TextStyle(
                                  fontFamily: "Libre_Regular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2.8 * SizeConfig.heightMultiplier),
                            )),
                      ),
                      SizedBox(
                        height: 0.526 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0 * SizeConfig.widthMultiplier),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.page_7_text_9,
                              style: TextStyle(
                                  fontFamily: "Libre_Regular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2.6 * SizeConfig.heightMultiplier,
                                  color: Color.fromARGB(255, 78, 76, 76)),
                            )),
                      ),
                      SizedBox(
                        height: 0.526 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0 * SizeConfig.widthMultiplier),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.page_7_text_10,
                              style: TextStyle(
                                  fontFamily: "Libre_Regular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2.4 * SizeConfig.heightMultiplier,
                                  color: Color.fromARGB(255, 78, 76, 76)),
                            )),
                      ),
                      SizedBox(
                        height: 3.160 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0 * SizeConfig.widthMultiplier),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.page_7_text_11,
                              style: TextStyle(
                                  fontFamily: "Libre_Regular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2.8 * SizeConfig.heightMultiplier),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0 * SizeConfig.widthMultiplier),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .page_7_text_12,
                                  style: TextStyle(
                                      fontFamily: "Libre_Regular",
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          2.6 * SizeConfig.heightMultiplier)),
                              TextSpan(
                                text: AppLocalizations.of(context)!
                                    .page_7_text_13,
                                style: TextStyle(
                                    fontFamily: "Libre_Regular",
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    decorationThickness: 2,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        2.6 * SizeConfig.heightMultiplier),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchUrl(
                                        "https://www.fda.gov/drugs/disposal-unused-medicines-what-you-should-know/drug-disposal-fdas-flush-list-certain-medicines");
                                  },
                              )
                            ]))),
                      ),
                      SizedBox(
                        height: 3 * SizeConfig.heightMultiplier,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 5 * SizeConfig.heightMultiplier,
          ),

          //* Non-Flush Drugs
          Row(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 84.536 * SizeConfig.heightMultiplier,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      //* Blue Card
                      Padding(
                        padding: EdgeInsets.only(
                            right: 14 * SizeConfig.heightMultiplier),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: double.infinity,
                            decoration:
                                BoxDecoration(color: Colours.Light_Blue),
                          ),
                        ),
                      ),

                      //* Photo
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 4 * SizeConfig.widthMultiplier,
                                left: 5.793 * SizeConfig.heightMultiplier),
                            child: Image.asset(
                              Images.Image_6,
                              scale: 0.07 * SizeConfig.widthMultiplier,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 2.8 * SizeConfig.widthMultiplier),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(0, _positionAnimation.value),
                              child: Opacity(
                                opacity: _opacityAnimation.value,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .page_8_title_1,
                                      style: TextStyle(
                                          fontFamily: "Libre_Regular",
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              6.4 * SizeConfig.heightMultiplier,
                                          color:
                                              Colors.black),
                                    )),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 3 * SizeConfig.heightMultiplier,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0 * SizeConfig.widthMultiplier),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppLocalizations.of(context)!.page_8_text_1,
                                style: TextStyle(
                                    fontFamily: "Libre_Regular",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 3.6 * SizeConfig.heightMultiplier,
                                    color: Color.fromARGB(255, 78, 76, 76)),
                              )),
                        ),
                        SizedBox(
                          height: 2.633 * SizeConfig.heightMultiplier,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0 * SizeConfig.widthMultiplier),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppLocalizations.of(context)!.page_8_text_2,
                                style: TextStyle(
                                    fontFamily: "Libre_Regular",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 2.8 * SizeConfig.heightMultiplier,
                                    color: Color.fromARGB(255, 78, 76, 76)),
                              )),
                        ),
                        SizedBox(
                          height: 1.053 * SizeConfig.heightMultiplier,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0 * SizeConfig.widthMultiplier),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppLocalizations.of(context)!.page_8_text_3,
                                style: TextStyle(
                                    fontFamily: "Libre_Regular",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 2.8 * SizeConfig.heightMultiplier,
                                    color: Color.fromARGB(255, 78, 76, 76)),
                              )),
                        ),
                        SizedBox(
                          height: 1.053 * SizeConfig.heightMultiplier,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0 * SizeConfig.widthMultiplier),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppLocalizations.of(context)!.page_8_text_4,
                                style: TextStyle(
                                    fontFamily: "Libre_Regular",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 2.8 * SizeConfig.heightMultiplier,
                                    color: Color.fromARGB(255, 78, 76, 76)),
                              )),
                        ),
                        SizedBox(
                          height: 1.053 * SizeConfig.heightMultiplier,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0 * SizeConfig.widthMultiplier),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppLocalizations.of(context)!.page_8_text_5,
                                style: TextStyle(
                                    fontFamily: "Libre_Regular",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 2.8 * SizeConfig.heightMultiplier,
                                    color: Color.fromARGB(255, 78, 76, 76)),
                              )),
                        ),
                        SizedBox(
                          height: 1.053 * SizeConfig.heightMultiplier,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0 * SizeConfig.widthMultiplier),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: AppLocalizations.of(context)!
                                        .page_8_text_6,
                                    style: TextStyle(
                                        fontFamily: "Libre_Regular",
                                        color: Color.fromARGB(255, 78, 76, 76),
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            2.8 * SizeConfig.heightMultiplier)),
                                TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .page_8_text_7,
                                  style: TextStyle(
                                      fontFamily: "Libre_Regular",
                                      decoration: TextDecoration.underline,
                                      color: Color.fromARGB(255, 78, 76, 76),
                                      decorationThickness: 2,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          2.8 * SizeConfig.heightMultiplier),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _launchUrl(
                                          "https://www.fda.gov/drugs/safe-disposal-medicines/disposal-unused-medicines-what-you-should-know");
                                    },
                                )
                              ]))),
                        ),
                        SizedBox(
                          height: 3.160 * SizeConfig.heightMultiplier,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}