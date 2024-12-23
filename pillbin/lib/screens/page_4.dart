import 'package:flutter/material.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/strings/strings.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key,required this.ontap, required this.pageIndex, required this.pageNotifier});
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
            height: 30,
          ),
          SizedBox(
            height: 810,
            child: Stack(
              fit: StackFit.expand,
              children: [
                FractionallySizedBox(
                  alignment: Alignment.topLeft,
                  heightFactor: 0.4,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      "Impact of Pharmaceutical",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Hanken_Bold",
                          fontSize: 35),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.bottomLeft,
                  heightFactor: 0.944,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Contaminants on Biodiversity and",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Hanken_Bold",
                          fontSize: 35),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.bottomLeft,
                  heightFactor: 0.825,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Ecosystems",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Hanken_Bold",
                          fontSize: 35),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.bottomLeft,
                  heightFactor: 0.73,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12, right: 5),
                    child: Text(
                      Strings.Imapct_1,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Libre_Regular",
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AspectRatio(
                aspectRatio: 1.6,
                child: Image.asset(
                  Images.Image_4,
                )),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
