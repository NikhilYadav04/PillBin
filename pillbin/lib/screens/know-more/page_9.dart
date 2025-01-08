import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

class _Page9State extends State<Page9> with SingleTickerProviderStateMixin {
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
            SizedBox(
              height: 1.580 * SizeConfig.heightMultiplier,
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _positionAnimation.value),
                  child: Opacity(
                    opacity: _opacityAnimation.value,
                    child: Padding(
                        padding: EdgeInsets.only(),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.page_9_title_1,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Hanken_Bold",
                                fontSize: 4.213 * SizeConfig.heightMultiplier,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        )),
                  ),
                );
              },
            ),
            SizedBox(
              height: 3.160 * SizeConfig.heightMultiplier,
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 1.580 * SizeConfig.heightMultiplier),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _urlLauncher(
                          AppLocalizations.of(context)!.page_9_info_1,
                          "https://www.youtube.com/watch?v=2kAklblMi24"),
                    ],
                  ),
                  SizedBox(
                    height: 1.053 * SizeConfig.heightMultiplier,
                  ),
                  _urlLauncher(AppLocalizations.of(context)!.page_9_info_2,
                      "https://ntep.in/node/2439/CP-disposal-expired-supplies"),
                  SizedBox(
                    height: 1.053 * SizeConfig.heightMultiplier,
                  ),
                  _urlLauncher(
                      AppLocalizations.of(context)!.page_9_info_3,
                      "https://pib.gov.in/newsite/PrintRelease.aspx?relid=178039#:~:text=All%20bio%2Dmedical%20waste%20shall,for%20all%20disposal%20of%20waste"),
                  SizedBox(
                    height: 2* SizeConfig.heightMultiplier,
                  ),
                  FaIcon(
                    FontAwesomeIcons.youtube,
                    color: Colors.red,
                    size: 42,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 3 * SizeConfig.heightMultiplier,
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
                        AppLocalizations.of(context)!.page_9_NGO_text,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Hanken_Bold",
                          fontSize: 3.2 * SizeConfig.heightMultiplier,
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
                          _urlLauncher(AppLocalizations.of(context)!.page_9_NGO_text_1,
                              "https://dc.kerala.gov.in/en/the-proud-project-for-the-removal-of-unused-and-date-expired-medicines-from-the-market-mou-signed-between-the-managing-director-clean-kerala-company-and-the-drugs-controller-of-kerala-on-26-08/"),
                          SizedBox(
                            height: 1.053 * SizeConfig.heightMultiplier,
                          ),
                          _urlLauncher(AppLocalizations.of(context)!.page_9_NGO_text_2,
                              "https://www.instagram.com/sharemeds/"),
                          SizedBox(
                            height: 1.053 * SizeConfig.heightMultiplier,
                          ),
                          _urlLauncher(AppLocalizations.of(context)!.page_9_NGO_text_3,
                              "https://www.medicinebaba.in/index.php"),
                          SizedBox(
                            height: 1.053 * SizeConfig.heightMultiplier,
                          ),
                          _urlLauncher(
                              AppLocalizations.of(context)!.page_9_NGO_text_4,
                              "https://www.udayfoundation.org/"),
                          SizedBox(
                            height: 1.053 * SizeConfig.heightMultiplier,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2 * SizeConfig.heightMultiplier,
                  ),
                ],
              ),
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
                        AppLocalizations.of(context)!.page_9_Company_text,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Hanken_Bold",
                          fontSize: 3.2 * SizeConfig.heightMultiplier,
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
                          _urlLauncher( AppLocalizations.of(context)!.page_9_Company_text_1,
                              "https://bangaloreinternationalcentre.org/bcause/nonprofits/environmental-synergies-in-development/"),
                          SizedBox(
                            height: 1.053 * SizeConfig.heightMultiplier,
                          ),
                          _urlLauncher( AppLocalizations.of(context)!.page_9_Company_text_2,
                              "https://safewaternetwork.org/our-work/india/"),
                          SizedBox(
                            height: 1.053 * SizeConfig.heightMultiplier,
                          ),
                          _urlLauncher( AppLocalizations.of(context)!.page_9_Company_text_3,
                              "https://ramky.com/"),
                          SizedBox(
                            height: 1.053 * SizeConfig.heightMultiplier,
                          ),
                          _urlLauncher(
                               AppLocalizations.of(context)!.page_9_Company_text_4,
                              "https://www.synergywastemgmt.com/"),
                          SizedBox(
                            height: 1.053 * SizeConfig.heightMultiplier,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2 * SizeConfig.heightMultiplier,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _urlLauncher(String text, String url) {
    return GestureDetector(
      onTap: () {
        _launchUrl(url);
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Libre_Regular",
              fontSize: 2.106 * SizeConfig.heightMultiplier,
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
