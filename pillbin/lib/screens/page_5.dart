import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings.dart';

class Page5 extends StatefulWidget {
  const Page5(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> with SingleTickerProviderStateMixin {
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
            height: 24.85 * SizeConfig.heightMultiplier,
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
                            padding: EdgeInsets.only(),
                            child: Center(
                              child: Text(
                                strings.page_5_title_1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Hanken_Bold",
                                    fontSize:
                                        4.1 * SizeConfig.heightMultiplier),
                              ),
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
                          heightFactor: 1.150,
                          child: Padding(
                            padding: EdgeInsets.symmetric(),
                            child: Center(
                              child: Text(
                                strings.page_5_title_2,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Hanken_Bold",
                                    fontSize:
                                        4.1 * SizeConfig.heightMultiplier),
                              ),
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
                          heightFactor: 0.72,
                          child: Padding(
                            padding: EdgeInsets.symmetric(),
                            child: Center(
                              child: Text(
                                strings.page_5_title_3,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Hanken_Bold",
                                    fontSize:
                                        4.1 * SizeConfig.heightMultiplier),
                              ),
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
                          heightFactor: 0.28,
                          child: Padding(
                            padding: EdgeInsets.symmetric(),
                            child: Center(
                              child: Text(
                               strings.page_5_title_4,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Hanken_Bold",
                                    fontSize:
                                        4.1 * SizeConfig.heightMultiplier),
                              ),
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
            height: 3.160 * SizeConfig.heightMultiplier,
          ),
          SizedBox(
            height: 35.814 * SizeConfig.heightMultiplier,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 2.678 * SizeConfig.widthMultiplier),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (builder, index) {
                    return Row(
                      children: [
                        Card(strings.rules_strict[0], strings.rules_desc[0]),
                        SizedBox(
                          width: 2.678 * SizeConfig.widthMultiplier,
                        ),
                        Card(strings.rules_strict[1], strings.rules_desc[1])
                      ],
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 35.814 * SizeConfig.heightMultiplier,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 2.678 * SizeConfig.widthMultiplier),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (builder, index) {
                    return Row(
                      children: [
                        Card(strings.rules_strict[2], strings.rules_desc[2]),
                        SizedBox(
                          width: 2.678 * SizeConfig.widthMultiplier,
                        ),
                        Card(strings.rules_strict[3], strings.rules_desc[3])
                      ],
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 1.053 * SizeConfig.heightMultiplier,
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
            horizontal: 1.785 * SizeConfig.widthMultiplier,
            vertical: 1.6 * SizeConfig.heightMultiplier),
        height: 34.00 * SizeConfig.heightMultiplier,
        width: 45.758 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(1.474 * SizeConfig.heightMultiplier),
            color: Colours.Light_Blue),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Hanken_Bold",
                  fontSize: 2.001 * SizeConfig.heightMultiplier,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 1.264 * SizeConfig.heightMultiplier,
            ),
            Text(
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              desc,
              style: TextStyle(
                  color: Colors.grey.shade900,
                  fontFamily: "Libre_Regular",
                  fontSize: 1.422 * SizeConfig.heightMultiplier,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      SizedBox(
        height: 1.580 * SizeConfig.heightMultiplier,
      )
    ],
  );
}
