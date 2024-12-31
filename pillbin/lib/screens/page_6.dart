import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings.dart';

class Page6 extends StatefulWidget {
  Page6(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page6> createState() => _Page6State();
}

class _Page6State extends State<Page6> with SingleTickerProviderStateMixin {
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
    final strings = Strings(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 1.053 * SizeConfig.heightMultiplier,
          ),
          SizedBox(
            height: 15.800 * SizeConfig.heightMultiplier,
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
                        child: FractionallySizedBox(
                          alignment: Alignment.topCenter,
                          heightFactor: 0.4,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 6.320 * SizeConfig.heightMultiplier),
                            child: Text(
                              strings.page_6_title_1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Hanken_Bold",
                                  fontSize:
                                      4.634 * SizeConfig.heightMultiplier),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _positionAnimation.value),
                      child: Opacity(
                        opacity: _opacityAnimation.value,
                        child: FractionallySizedBox(
                          alignment: Alignment.bottomLeft,
                          heightFactor: 0.62,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.66 * SizeConfig.widthMultiplier),
                            child: Text(
                              strings.page_6_title_2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Hanken_Bold",
                                  fontSize:
                                      4.634 * SizeConfig.heightMultiplier),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0,
          ),
          SizedBox(
            height: 37.921 * SizeConfig.heightMultiplier,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 2.678 * SizeConfig.widthMultiplier),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (builder, index) {
                    return Row(
                      children: [
                        Card(strings.drug_title[0], strings.drug_desc[0]),
                        SizedBox(
                          width: 2.678 * SizeConfig.widthMultiplier,
                        ),
                        Card(strings.drug_title[1], strings.drug_desc[1])
                      ],
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 37.921 * SizeConfig.heightMultiplier,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 2.678 * SizeConfig.widthMultiplier),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (builder, index) {
                    return Row(
                      children: [
                        Card(strings.drug_title[2], strings.drug_desc[2]),
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
        padding: EdgeInsets.symmetric(
            horizontal: 1.8 * SizeConfig.widthMultiplier,
            vertical: 1.896 * SizeConfig.heightMultiplier),
        height: 35.814 * SizeConfig.heightMultiplier,
        width: 45.758 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(1.474 * SizeConfig.heightMultiplier),
            color: Colours.Light_Blue),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 2.232 * SizeConfig.widthMultiplier),
              height: 7.373 * SizeConfig.heightMultiplier,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      3.160 * SizeConfig.heightMultiplier),
                  color: Colors.white),
              child: Center(
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Hanken_Bold",
                      fontSize: 1.8 * SizeConfig.heightMultiplier,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 1.896 * SizeConfig.heightMultiplier,
            ),
            Text(
              maxLines: 11,
              overflow: TextOverflow.ellipsis,
              desc,
              style: TextStyle(
                  color: Color.fromARGB(255, 50, 49, 49),
                  fontFamily: "Libre_Regular",
                  fontSize: 1.41 * SizeConfig.heightMultiplier,
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
