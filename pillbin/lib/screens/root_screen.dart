// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:pillbin/screens/page_1.dart';
import 'package:pillbin/screens/page_2.dart';
import 'package:pillbin/screens/page_3.dart';
import 'package:pillbin/screens/page_4.dart';
import 'package:pillbin/screens/page_5.dart';
import 'package:pillbin/screens/page_6.dart';
import 'package:pillbin/screens/page_7.dart';
import 'package:pillbin/screens/page_8.dart';
import 'package:pillbin/screens/page_9.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings.dart';

class RootScreen extends StatefulWidget {
   RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ValueNotifier<int> pageNotifier = ValueNotifier<int>(0);
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colours.Very_Light_Blue,
      endDrawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 2.633*SizeConfig.heightMultiplier,
            ),
            for (int i = 0; i < 7; i++)
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: ListTile(
                  title: Text(
                    Strings.drawer_items[i],
                    style: TextStyle(
                        fontSize: 2.212*SizeConfig.heightMultiplier,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                        fontFamily: "Libre_Regular"),
                  ),
                  onTap: () {
                    i == 3
                        ? _navigateToPage(i + 1)
                        : i == 4
                            ? _navigateToPage(i + 1)
                            : i == 5
                                ? _navigateToPage(i + 1)
                                : i == 6
                                    ? _navigateToPage(i + 2)
                                    : _navigateToPage(i);
                  },
                ),
              )
          ],
        ),
        width: 66.964*SizeConfig.widthMultiplier,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colours.Very_Light_Blue,
      ),
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colours.Very_Light_Blue,
        toolbarHeight: 7.373*SizeConfig.heightMultiplier,
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              size: 5.266*SizeConfig.heightMultiplier,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
          SizedBox(
            width: 1.339*SizeConfig.widthMultiplier,
          )
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [
          Page1(
            ontap: () {
              pageController.nextPage(
                  duration: Duration(milliseconds: 500), curve: Curves.linear);
            },
            pageIndex: 0,
            pageNotifier: pageNotifier,
          ),
          Page2(
            ontap: () {},
            pageIndex: 1,
            pageNotifier: pageNotifier,
          ),
          Page3(
            ontap: () {},
            pageIndex: 2,
            pageNotifier: pageNotifier,
          ),
          Page4(
            ontap: () {},
            pageIndex: 3,
            pageNotifier: pageNotifier,
          ),
          Page5(
            ontap: () {},
            pageIndex: 4,
            pageNotifier: pageNotifier,
          ),
          Page6(
            ontap: () {},
            pageIndex: 5,
            pageNotifier: pageNotifier,
          ),
          Page7(
            ontap: () {},
            pageIndex: 6,
            pageNotifier: pageNotifier,
          ),
          Page8(
            ontap: () {},
            pageIndex: 7,
            pageNotifier: pageNotifier,
          ),
          Page9(
            ontap: () {},
            pageIndex: 8,
            pageNotifier: pageNotifier,
          )
        ],
      ),
    ));
  }

  void _navigateToPage(int index) {
    Navigator.pop(context); // Close the drawer
    Future.delayed(const Duration(milliseconds: 300), () {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500), // Animation duration
        curve: Curves.easeInOut, // Animation curve for smooth scrolling
      );
    });
  }
}