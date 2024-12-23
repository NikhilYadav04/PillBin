import 'package:flutter/material.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings.dart';

class Page4 extends StatefulWidget {
  Page4(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 3.160 * SizeConfig.heightMultiplier,
          ),
          SizedBox(
            height: 27.323 * SizeConfig.heightMultiplier,
            child: Stack(
              fit: StackFit.expand,
              children: [
                FractionallySizedBox(
                  alignment: Alignment.topLeft,
                  heightFactor: 0.4,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 2.678 * SizeConfig.widthMultiplier),
                    child: Text(
                      "Impact of\nPharmaceutical",

                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Hanken_Bold",
                          fontSize: 3.686 * SizeConfig.heightMultiplier),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.bottomLeft,
                  heightFactor: 0.615,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 2.678 * SizeConfig.widthMultiplier),
                    child: Text(
                      "Contaminants on Biodiversity and",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Hanken_Bold",
                          fontSize: 3.686 * SizeConfig.heightMultiplier),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.bottomLeft,
                  heightFactor: 0.22,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 2.678 * SizeConfig.widthMultiplier),
                    child: Text(
                      "Ecosystems",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Hanken_Bold",
                          fontSize: 3.686 * SizeConfig.heightMultiplier),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.053*SizeConfig.heightMultiplier,),
          Padding(
            padding: EdgeInsets.only(
                left: 1.264 * SizeConfig.heightMultiplier,
                right: 0.526 * SizeConfig.heightMultiplier),
            child: Text(
              Strings.Imapct_1,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Libre_Regular",
                  fontSize: 2.1067 * SizeConfig.heightMultiplier),
            ),
          ),
          SizedBox(
            height: 2.633*SizeConfig.heightMultiplier,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.678 * SizeConfig.widthMultiplier),
            child: AspectRatio(
                aspectRatio: 0.168 * SizeConfig.heightMultiplier,
                child: Image.asset(
                  Images.Image_4,
                )),
          ),
          SizedBox(
            height: 3.160 * SizeConfig.heightMultiplier,
          ),
        ],
      ),
    );
  }
}
