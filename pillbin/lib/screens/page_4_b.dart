import 'package:flutter/material.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../styling/colors/colors.dart';

class Page4B extends StatefulWidget {
  Page4B(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page4B> createState() => _Page4BState();
}

class _Page4BState extends State<Page4B> with SingleTickerProviderStateMixin {
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
          Container(
            color: Colours.Very_Light_Blue,
            height: 2 * SizeConfig.heightMultiplier,
          ),
          Container(
            height: 13.167*SizeConfig.heightMultiplier,
            color: Colours.Very_Light_Blue,
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
                              AppLocalizations.of(context)!.page_4b_title_1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Hanken_Bold",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 4.1 * SizeConfig.heightMultiplier),
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
                          alignment: Alignment.topLeft,
                          heightFactor: 1.25,
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.page_4b_title_2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Hanken_Bold",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 4.1 * SizeConfig.heightMultiplier),
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
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 2.678 * SizeConfig.widthMultiplier),
            child: Column(
              children: [
                SizedBox(
                  height: 1 * SizeConfig.heightMultiplier,
                ),
                strings.survey,
                SizedBox(
                  height: 3 * SizeConfig.heightMultiplier,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.357*SizeConfig.widthMultiplier),
            child: Column(
              children: [
                Center(
                  child: Text(
                    strings.survey_2,
                    style: style.copyWith(color: Colors.black, fontSize: 1.790*SizeConfig.heightMultiplier),
                  ),
                ),
                SizedBox(
                  height: 2 * SizeConfig.heightMultiplier,
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/survey.png",
            height: 43.715*SizeConfig.heightMultiplier,
            width: 92.633*SizeConfig.widthMultiplier,
          ),
          SizedBox(
            height: 3 * SizeConfig.heightMultiplier,
          ),
        ],
      ),
    );
  }
}
