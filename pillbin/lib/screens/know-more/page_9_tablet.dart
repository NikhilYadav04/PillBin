import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Page9Tablet extends StatefulWidget {
  const Page9Tablet({super.key});

  @override
  State<Page9Tablet> createState() => _Page9TabletState();
}

class _Page9TabletState extends State<Page9Tablet>
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
              height: 53.861 * SizeConfig.heightMultiplier,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  //* poster
                  FractionallySizedBox(
                    heightFactor: 1,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/more_poster.png",
                        fit: BoxFit.fitWidth,
                        width: 101.5625 * SizeConfig.widthMultiplier,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2 * SizeConfig.heightMultiplier,
            ),
            //* 3 Links
            Padding(
              padding: EdgeInsets.only(
                          left: 4.8 * SizeConfig.heightMultiplier),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _positionAnimation.value),
                        child: Opacity(
                          opacity: _opacityAnimation.value,
                          child: Text(
                            "For More Information : ",
                            style: TextStyle(
                                fontFamily: "Hanken_Bold",
                                fontSize: 6.5 * SizeConfig.heightMultiplier,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                decorationColor: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                  Row(
                    children: [
                      _urlLauncher(
                          AppLocalizations.of(context)!.page_9_info_1_tablet,
                          "https://www.youtube.com/watch?v=2kAklblMi24",
                          Colors.black),
                      SizedBox(
                        width: 2.34375 * SizeConfig.widthMultiplier,
                      ),
                      Image.asset(
                        "assets/yt.png",
                        height: 6.6489 * SizeConfig.heightMultiplier,
                        width: 3.90625 * SizeConfig.widthMultiplier,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.053 * SizeConfig.heightMultiplier,
                  ),
                  _urlLauncher(
                      AppLocalizations.of(context)!.page_9_info_2_tablet,
                      "https://ntep.in/node/2439/CP-disposal-expired-supplies",
                      Colors.black),
                  SizedBox(
                    height: 1.053 * SizeConfig.heightMultiplier,
                  ),
                  _urlLauncher(
                      AppLocalizations.of(context)!.page_9_info_3_tablet,
                      "https://pib.gov.in/newsite/PrintRelease.aspx?relid=178039#:~:text=All%20bio%2Dmedical%20waste%20shall,for%20all%20disposal%20of%20waste",
                      Colors.black),
                ],
              ),
            ),
            SizedBox(
              height: 4 * SizeConfig.heightMultiplier,
            ),

            //* Below Links
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //* NGO's Links
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 4.8 * SizeConfig.heightMultiplier),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppLocalizations.of(context)!.page_9_NGO_text,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Hanken_Bold",
                              fontSize: 4 * SizeConfig.heightMultiplier,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.4 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 4.8 * SizeConfig.heightMultiplier),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _urlLauncher(
                                  AppLocalizations.of(context)!.page_9_NGO_text_1,
                                  "https://dc.kerala.gov.in/en/the-proud-project-for-the-removal-of-unused-and-date-expired-medicines-from-the-market-mou-signed-between-the-managing-director-clean-kerala-company-and-the-drugs-controller-of-kerala-on-26-08/",
                                  Colors.black),
                              SizedBox(
                                height: 1.053 * SizeConfig.heightMultiplier,
                              ),
                              _urlLauncher(
                                  AppLocalizations.of(context)!.page_9_NGO_text_2,
                                  "https://www.instagram.com/sharemeds/",
                                  Colors.black),
                              SizedBox(
                                height: 1.053 * SizeConfig.heightMultiplier,
                              ),
                              _urlLauncher(
                                  AppLocalizations.of(context)!.page_9_NGO_text_3,
                                  "https://www.medicinebaba.in/index.php",
                                  Colors.black),
                              SizedBox(
                                height: 1.053 * SizeConfig.heightMultiplier,
                              ),
                              _urlLauncher(
                                  AppLocalizations.of(context)!.page_9_NGO_text_4,
                                  "https://www.udayfoundation.org/",
                                  Colors.black),
                              SizedBox(
                                height: 1.053 * SizeConfig.heightMultiplier,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //* Bio-Waste Links
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: 2 * SizeConfig.heightMultiplier),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppLocalizations.of(context)!.page_9_Company_text,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Hanken_Bold",
                              fontSize: 4 * SizeConfig.heightMultiplier,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.4 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: 1 * SizeConfig.heightMultiplier),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _urlLauncher(
                                  "• Environment Synergies in Development (Ensyde)",
                                  "https://bangaloreinternationalcentre.org/bcause/nonprofits/environmental-synergies-in-development/",
                                  Colors.black),
                              SizedBox(
                                height: 1.053 * SizeConfig.heightMultiplier,
                              ),
                              _urlLauncher(
                                  AppLocalizations.of(context)!
                                      .page_9_Company_text_2,
                                  "https://safewaternetwork.org/our-work/india/",
                                  Colors.black),
                              SizedBox(
                                height: 1.053 * SizeConfig.heightMultiplier,
                              ),
                              _urlLauncher(
                                  AppLocalizations.of(context)!
                                      .page_9_Company_text_3,
                                  "https://ramky.com/",
                                  Colors.black),
                              SizedBox(
                                height: 1.053 * SizeConfig.heightMultiplier,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2 * SizeConfig.heightMultiplier,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _urlLauncherCenter(
                  AppLocalizations.of(context)!.page_9_Company_text_4,
                  "https://www.synergywastemgmt.com/",
                  Colors.black),
            ),
            SizedBox(
              height: 5 * SizeConfig.heightMultiplier,
            ),
          ],
        ),
      ),
    );
  }

  Widget _urlLauncher(String text, String url, Color color) {
    return GestureDetector(
      onTap: () {
        _launchUrl(url);
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontFamily: "Hanken_Bold",
              fontSize: 3.8 * SizeConfig.heightMultiplier,
              decoration: TextDecoration.underline,
              decorationColor: color),
        ),
      ),
    );
  }

  Widget _urlLauncherCenter(String text, String url, Color color) {
    return GestureDetector(
      onTap: () {
        _launchUrl(url);
      },
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontFamily: "Hanken_Bold",
              fontSize: 3.8 * SizeConfig.heightMultiplier,
              decoration: TextDecoration.underline,
              decorationColor: color),
        ),
      ),
    );
  }
}
