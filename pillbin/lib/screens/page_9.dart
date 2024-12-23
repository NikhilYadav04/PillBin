import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:url_launcher/url_launcher.dart';

class Page9 extends StatefulWidget {
  Page9(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page9> createState() => _Page9State();
}

class _Page9State extends State<Page9> {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colours.Light_Blue,
        child: Column(
          children: [
            Image.asset(Images.Poster),
            SizedBox(height: 1.580*SizeConfig.heightMultiplier,),
            Padding(
                padding: EdgeInsets.only(),
                child: Center(
                  child: Text(
                    "For more information",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Hanken_Bold",
                        fontSize: 4.213 * SizeConfig.heightMultiplier,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )),
            SizedBox(
              height: 3.160 * SizeConfig.heightMultiplier,
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 1.580 * SizeConfig.heightMultiplier),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Websites",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Hanken_Bold",
                          fontSize: 3.686 * SizeConfig.heightMultiplier,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.106 * SizeConfig.heightMultiplier,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 1.580 * SizeConfig.heightMultiplier),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchUrl(
                                  "https://www.fda.gov/drugs/safe-disposal-medicines/disposal-unused-medicines-what-you-should-know");
                            },
                            child: Text(
                              "FDA Disposal",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Libre_Regular",
                                  fontSize: 2.106 * SizeConfig.heightMultiplier,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          SizedBox(
                            height: 1.053 * SizeConfig.heightMultiplier,
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchUrl(
                                  "https://www.fda.gov/drugs/disposal-unused-medicines-what-you-should-know/drug-disposal-fdas-flush-list-certain-medicines");
                            },
                            child: Text(
                              "FDA Flush List",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Libre_Regular",
                                  fontSize: 2.106 * SizeConfig.heightMultiplier,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          SizedBox(
                            height: 1.053 * SizeConfig.heightMultiplier,
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchUrl(
                                  "https://pib.gov.in/newsite/PrintRelease.aspx?relid=178039");
                            },
                            child: Text(
                              "Guidelines for Safe Disposal Of Drugs",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Libre_Regular",
                                  fontSize: 2.106 * SizeConfig.heightMultiplier,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          SizedBox(
                            height: 1.053 * SizeConfig.heightMultiplier,
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchUrl(
                                  "https://www.sciencedirect.com/science/article/abs/pii/S0048969717313773");
                            },
                            child: Text(
                              "Risks associated with environmental release of API",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Libre_Regular",
                                  fontSize: 2.106 * SizeConfig.heightMultiplier,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          SizedBox(
                            height: 1.053 * SizeConfig.heightMultiplier,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35.814 * SizeConfig.heightMultiplier,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
