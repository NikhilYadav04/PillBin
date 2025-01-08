import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class Page3 extends StatefulWidget {
  Page3(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
    final strings = Strings(context);
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 48.536 * SizeConfig.heightMultiplier,
          child: Stack(
            fit: StackFit.expand,
            children: [
              //* Blue Card
              FractionallySizedBox(
                heightFactor: 0.95,
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
                heightFactor: 1.05,
                alignment: Alignment.bottomLeft,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 5.793 * SizeConfig.heightMultiplier),
                    child: Image.asset(
                      Images.Image_2,
                      scale: 0.356 * SizeConfig.widthMultiplier,
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 1.053 * SizeConfig.heightMultiplier,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 2.678 * SizeConfig.widthMultiplier),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                strings.page_3_title,
                style: TextStyle(
                    fontFamily: "Libre_Bold",
                    fontWeight: FontWeight.bold,
                    fontSize: 4.213 * SizeConfig.heightMultiplier),
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
                      text: "• ", style: style.copyWith(color: Colors.black)),
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
      ]),
    );
  }
}

TextStyle style = TextStyle(
    letterSpacing: 1,
    fontFamily: "Libre_Regular",
    fontWeight: FontWeight.w600,
    fontSize: 2.001 * SizeConfig.heightMultiplier);
