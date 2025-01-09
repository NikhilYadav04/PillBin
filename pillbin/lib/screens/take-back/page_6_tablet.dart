import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/string_tablet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Page6Tablet extends StatefulWidget {
  const Page6Tablet({super.key});

  @override
  State<Page6Tablet> createState() => _Page6TabletState();
}

class _Page6TabletState extends State<Page6Tablet>
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
                                    horizontal: 5 * SizeConfig.widthMultiplier),
                                child: Text(
                                  "${AppLocalizations.of(context)!.page_6_title_1} ${AppLocalizations.of(context)!.page_6_title_2}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Hanken_Bold",
                                      fontSize:
                                          6 * SizeConfig.heightMultiplier),
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
            height: 6 * SizeConfig.heightMultiplier,
          ),
          Padding(

            padding: EdgeInsets.symmetric(horizontal: 2*SizeConfig.widthMultiplier),
            child: Row(
              children: [
                Card(strings.drug_title[0], strings.drug_desc[0]),
                SizedBox(
                  width: 2.678 * SizeConfig.widthMultiplier,
                ),
                Card(strings.drug_title[1], strings.drug_desc[1]),
                SizedBox(
                  width: 2.678 * SizeConfig.widthMultiplier,
                ),
                Card(strings.drug_title[2], strings.drug_desc[2])
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget Card(String title, String desc) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: 1.8 * SizeConfig.widthMultiplier,
            vertical: 1.896 * SizeConfig.heightMultiplier),
        height: 60 * SizeConfig.heightMultiplier,
        width: 29.9 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(1.474 * SizeConfig.heightMultiplier),
            color: Colours.Light_Blue),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 2.232 * SizeConfig.widthMultiplier),
              height: 15.373 * SizeConfig.heightMultiplier,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      6 * SizeConfig.heightMultiplier),
                  color: Colors.white),
              child: Center(
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Hanken_Bold",
                      fontSize: 3.8* SizeConfig.heightMultiplier,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 2.8 * SizeConfig.heightMultiplier,
            ),
            Text(
              maxLines: 11,
              overflow: TextOverflow.ellipsis,
              desc,
              style: TextStyle(
                  color: Color.fromARGB(255, 50, 49, 49),
                  fontFamily: "Libre_Regular",
                  fontSize: 2.7 * SizeConfig.heightMultiplier,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      SizedBox(
        height: 2.106 * SizeConfig.heightMultiplier,
      )
    ],
  );
}
