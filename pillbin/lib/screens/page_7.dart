import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings_2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Page7 extends StatefulWidget {
  Page7(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> with SingleTickerProviderStateMixin {
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
    final strings = Strings2(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 3.160 * SizeConfig.heightMultiplier,
          ),
          SizedBox(
            height: 53 * SizeConfig.heightMultiplier,
            child: Stack(
              fit: StackFit.expand,
              children: [
                //* Blue Card
                FractionallySizedBox(
                  heightFactor: 0.7,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 1.580 * SizeConfig.heightMultiplier,
                        right: 10.534 * SizeConfig.heightMultiplier),
                    child: Container(
                      decoration: BoxDecoration(color: Colours.Light_Blue),
                    ),
                  ),
                ),

                //*Photo
                FractionallySizedBox(
                  heightFactor: 0.7,
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 13.167 * SizeConfig.heightMultiplier),
                      child: ClipRRect(
                        child: Image.asset(
                          Images.Image_5_1,
                          scale: 0.19 * SizeConfig.heightMultiplier,
                        ),
                      )),
                ),

                //*Text
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _positionAnimation.value),
                      child: Opacity(
                          opacity: _opacityAnimation.value,
                          child: FractionallySizedBox(
                            heightFactor: 0.26,
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      2.678 * SizeConfig.widthMultiplier),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    strings.page_7_title_1,
                                    style: TextStyle(
                                        fontFamily: "Libre_Bold",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 4.213 *
                                            SizeConfig.heightMultiplier),
                                  ),
                                  SizedBox(
                                    height: 1.580 * SizeConfig.heightMultiplier,
                                  ),
                                ],
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
            height: 0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.page_7_text_1,
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 3.686 * SizeConfig.heightMultiplier),
                )),
          ),
          SizedBox(
            height: 1.580 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.page_7_text_2,
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 2.317 * SizeConfig.heightMultiplier),
                )),
          ),
          SizedBox(
            height: 0.526 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.page_7_text_3,
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.896 * SizeConfig.heightMultiplier),
                )),
          ),
          SizedBox(
            height: 0.842 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.page_7_text_4,
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.738 * SizeConfig.heightMultiplier,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(
            height: 2.633 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.page_7_text_5,
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.896 * SizeConfig.heightMultiplier),
                )),
          ),
          SizedBox(
            height: 0.526 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.page_7_text_6,
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.896 * SizeConfig.heightMultiplier),
                )),
          ),
          SizedBox(
            height: 0.842 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                 AppLocalizations.of(context)!.page_7_text_7,
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.685 * SizeConfig.heightMultiplier,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(
            height: 2.633 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.page_7_text_8,
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.896 * SizeConfig.heightMultiplier),
                )),
          ),
          SizedBox(
            height: 0.526 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.page_7_text_9,
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.738 * SizeConfig.heightMultiplier,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(
            height: 0.526 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                 AppLocalizations.of(context)!.page_7_text_10,
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 1.738 * SizeConfig.heightMultiplier,
                      color: Color.fromARGB(255, 78, 76, 76)),
                )),
          ),
          SizedBox(
            height: 3.160 * SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.page_7_text_11,
                  style: TextStyle(
                      fontFamily: "Libre_Regular",
                      fontWeight: FontWeight.bold,
                      fontSize: 2.001 * SizeConfig.heightMultiplier),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.901 * SizeConfig.widthMultiplier),
            child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text:
                         AppLocalizations.of(context)!.page_7_text_12,
                      style: TextStyle(
                          fontFamily: "Libre_Regular",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 2.001 * SizeConfig.heightMultiplier)),
                  TextSpan(
                    text: AppLocalizations.of(context)!.page_7_text_13,
                    style: TextStyle(
                        fontFamily: "Libre_Regular",
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        decorationThickness: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: 2.001 * SizeConfig.heightMultiplier),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchUrl("https://www.fda.gov/drugs/disposal-unused-medicines-what-you-should-know/drug-disposal-fdas-flush-list-certain-medicines");
                      },
                  )
                ]))),
          ),
          SizedBox(
            height: 2.4 * SizeConfig.heightMultiplier,
          ),
        ],
      ),
    );
  }
}
