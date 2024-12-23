import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/strings/strings.dart';

class Page6 extends StatefulWidget {
  const Page6({super.key,required this.ontap, required this.pageIndex, required this.pageNotifier});
    final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page6> createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                FractionallySizedBox(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.4,
                  child: Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Text(
                      "Drug Take-Back",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Hanken_Bold",
                          fontSize: 44),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.bottomLeft,
                  heightFactor: 0.66,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 115),
                    child: Text(
                      "Programs",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Hanken_Bold",
                          fontSize: 44),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0,
          ),
          SizedBox(
            height: 360,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (builder, index) {
                    return Row(
                      children: [
                        Card(Strings.drug_title[0], Strings.drug_desc[0]),
                        SizedBox(
                          width: 12,
                        ),
                        Card(Strings.drug_title[1], Strings.drug_desc[1])
                      ],
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 360,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (builder, index) {
                    return Row(
                      children: [
                        Card(Strings.drug_title[2], Strings.drug_desc[2]),
                      ],
                    );
                  }),
            ),
          ),
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
        height: 340,
        width: 205,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), color: Colours.Light_Blue),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Hanken_Bold",
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              desc,
              style: TextStyle(
                  color: Color.fromARGB(255, 50, 49, 49),
                  fontFamily: "Libre_Regular",
                  fontSize: 13.5,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      SizedBox(
        height: 20,
      )
    ],
  );
}
