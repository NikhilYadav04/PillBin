import 'package:flutter/material.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings_2.dart';

class Page8A extends StatefulWidget {
  Page8A(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page8A> createState() => _Page8AState();
}

class _Page8AState extends State<Page8A> with SingleTickerProviderStateMixin {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 2.5 * SizeConfig.heightMultiplier,
          ),
          SizedBox(
            height: 17.323 * SizeConfig.heightMultiplier,
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
                          alignment: Alignment.topLeft,
                          heightFactor: 0.4,
                          child: Center(
                            child: Text(
                              "Views of Pharmacy Students",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Hanken_Bold",
                                  fontSize: 3.2 * SizeConfig.heightMultiplier),
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
                          heightFactor: 1.05,
                          child: Center(
                            child: Text(
                              "collected during survey on",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Hanken_Bold",
                                  fontSize: 3.2 * SizeConfig.heightMultiplier),
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
                          heightFactor: 0.5,
                          child: Center(
                            child: Text(
                              "Drug Disposal Awareness",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Hanken_Bold",
                                  fontSize: 3.1 * SizeConfig.heightMultiplier),
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
          SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
          _review(Strings2.view_student_1),
          SizedBox(height: 15,),
          _review(Strings2.view_student_2),
          SizedBox(height: 15,),
          _review(Strings2.view_student_3),
           SizedBox(height: 55,),
        ],
      ),
    );
  }
}

Widget _review(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            Images.Comma,
            height: 70,
            width: 70,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(text,
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 19,
                fontFamily: "Hanken_Medium")),
      ],
    ),
  );
}
