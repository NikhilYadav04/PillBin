import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/strings/strings.dart';

class Page5 extends StatefulWidget {
  const Page5({super.key,required this.ontap, required this.pageIndex, required this.pageNotifier});
    final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 160,
            child: Stack(
              fit: StackFit.expand,
              children: [
                FractionallySizedBox(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.4,
                  child: Padding(
                    padding: EdgeInsets.only(left: 48),
                    child: Text(
                      "Reasons for Strict",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Hanken_Bold",
                          fontSize: 42),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.bottomLeft,
                  heightFactor: 0.7,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    child: Text(
                      "rules on Medicinal",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Hanken_Bold",
                          fontSize: 42),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.bottomLeft,
                  heightFactor: 0.38,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 130),
                    child: Text(
                      "Disposal",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Hanken_Bold",
                          fontSize: 42),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 340,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (builder, index) {
                    return Row(
                      children: [
                        Card(Strings.rules_strict[0], Strings.rules_desc[0]),
                        SizedBox(
                          width: 12,
                        ),
                        Card(Strings.rules_strict[1], Strings.rules_desc[1])
                      ],
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 340,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (builder, index) {
                    return Row(
                      children: [
                        Card(Strings.rules_strict[2], Strings.rules_desc[2]),
                        SizedBox(
                          width: 12,
                        ),
                        Card(Strings.rules_strict[3], Strings.rules_desc[3])
                      ],
                    );
                  }),
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}

Widget Card(String title, String desc) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 18),
        height: 320,
        width: 205,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), color: Colours.Light_Blue),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Hanken_Bold",
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              desc,
              style: TextStyle(
                  color: Colors.grey.shade900,
                  fontFamily: "Libre_Regular",
                  fontSize: 13.5,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      SizedBox(
        height: 15,
      )
    ],
  );
}
