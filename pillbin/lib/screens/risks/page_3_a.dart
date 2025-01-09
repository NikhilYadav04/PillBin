import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Page3A extends StatefulWidget {
  Page3A(
      {super.key,
      required this.ontap,
      required this.pageIndex,
      required this.pageNotifier});
  final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page3A> createState() => _Page3AState();
}

class _Page3AState extends State<Page3A> with SingleTickerProviderStateMixin {
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
            color: Colours.Light_Blue,
            height: 3.160 * SizeConfig.heightMultiplier,
          ),
          Container(
            color: Colours.Light_Blue,
            height: 18.323 * SizeConfig.heightMultiplier,
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
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 2.678 * SizeConfig.widthMultiplier),
                            child: Text(
                              AppLocalizations.of(context)!.page_3a_title_1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Hanken_Bold",
                                  fontSize: 3.5 * SizeConfig.heightMultiplier),
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
                          heightFactor: 0.71,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.678 * SizeConfig.widthMultiplier),
                            child: Text(
                              AppLocalizations.of(context)!.page_3a_title_2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Hanken_Bold",
                                  fontSize: 3.5 * SizeConfig.heightMultiplier),
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
                          heightFactor: 0.42,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.678 * SizeConfig.widthMultiplier),
                            child: Text(
                              AppLocalizations.of(context)!.page_3a_title_3,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: "Hanken_Bold",
                                  fontSize: 3.5 * SizeConfig.heightMultiplier),
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
            color: Colours.Light_Blue,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 2.678 * SizeConfig.widthMultiplier),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  strings.drug_risks,
                  SizedBox(
                    height: 0 * SizeConfig.heightMultiplier,
                  ),
                  Image.asset(
                    Images.Image_3,
                    width: 93.75 * SizeConfig.widthMultiplier,
                    height: 44.243 * SizeConfig.heightMultiplier,
                  ),
                  SizedBox(
                    height: 1.8 * SizeConfig.heightMultiplier,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
