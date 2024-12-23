import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:url_launcher/url_launcher.dart';

class Page9 extends StatefulWidget {
  const Page9(
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
            SizedBox(
              height: 300,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  //* Image
                  FractionallySizedBox(
                      alignment: Alignment.bottomLeft,
                      heightFactor: 1.28,
                      child: Image.asset(Images.Image_8)),

                  //* Logo
                  FractionallySizedBox(
                    alignment: Alignment.bottomLeft,
                    heightFactor: 1.28,
                    child: Padding(
                        padding: EdgeInsets.only(right: 270),
                        child: Image.asset(
                          Images.Logo,
                          scale: 3,
                        )),
                  ),

                  //* Text
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.22,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "For more information",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Hanken_Bold",
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Websites",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Hanken_Bold",
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
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
                                  fontSize: 20,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          SizedBox(
                            height: 10,
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
                                  fontSize: 20,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          SizedBox(
                            height: 10,
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
                                  fontSize: 20,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          SizedBox(
                            height: 10,
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
                                  fontSize: 20,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 340,
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
