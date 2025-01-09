import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/string_tablet.dart';
import 'package:url_launcher/url_launcher.dart';

class Page3Tablet extends StatefulWidget {
  const Page3Tablet({super.key});

  @override
  State<Page3Tablet> createState() => _Page3TabletState();
}

class _Page3TabletState extends State<Page3Tablet> {
  String _url =
      "https://ehp.niehs.nih.gov/doi/full/10.1289/ehp.118-a210#:~:text=Taking%20unused%20pharmaceuticals%20out%20of%20landfills%20may%20make,may%20help%20prevent%20leftover%20pharmaceuticals%20from%20being%20misused.";

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = StringsTablet(context);
    return SingleChildScrollView(
      child: Row(
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
                        decoration: BoxDecoration(color: Colours.Light_Blue),
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
                          Images.Image_2,
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
                    height: 3*SizeConfig.heightMultiplier,
                  ),
                  Text(
                    strings.page_3_title,
                    style: TextStyle(
                        fontFamily: "Libre_Bold",
                        fontWeight: FontWeight.bold,
                        fontSize: 6 * SizeConfig.heightMultiplier),
                  ),
                  SizedBox(
                    height: 1.8 * SizeConfig.heightMultiplier,
                  ),
                  strings.drug,
                  SizedBox(
                    height: 1.8 * SizeConfig.heightMultiplier,
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchUrl(_url);
                    },
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "• ",
                          style: style.copyWith(color: Colors.black)),
                      TextSpan(
                          text: strings.know_more,
                          style: style.copyWith(
                              color: Colors.black,
                              decorationStyle: TextDecorationStyle.solid,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2))
                    ])),
                  ),
                  SizedBox(
                    height: 3 * SizeConfig.heightMultiplier,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle style = TextStyle(
    letterSpacing: 1,
    fontFamily: "Libre_Regular",
    fontWeight: FontWeight.w600,
    fontSize: 2.001 * SizeConfig.heightMultiplier);