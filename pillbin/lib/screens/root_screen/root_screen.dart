// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillbin/controller/GetX_dropdown.dart';
import 'package:pillbin/screens/chatbot/chatbot_screen.dart';
import 'package:pillbin/screens/intro/page_1.dart';
import 'package:pillbin/screens/about_us/page_2.dart';
import 'package:pillbin/screens/drug_disposal/page_3.dart';
import 'package:pillbin/screens/risks/page_3_a.dart';
import 'package:pillbin/screens/impact/page_4.dart';
import 'package:pillbin/screens/effect/page_4_a.dart';
import 'package:pillbin/screens/survey/page_4_b.dart';
import 'package:pillbin/screens/reasons/page_5.dart';
import 'package:pillbin/screens/take-back/page_6.dart';
import 'package:pillbin/screens/disposal/page_7.dart';
import 'package:pillbin/screens/disposal/page_8.dart';
import 'package:pillbin/screens/views/page_8_a.dart';
import 'package:pillbin/screens/views/page_8_b.dart';
import 'package:pillbin/screens/know-more/page_9.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/strings/strings.dart';
import 'package:pillbin/styling/widgets/widget.dart';

class RootScreen extends StatefulWidget {
  RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ValueNotifier<int> pageNotifier = ValueNotifier<int>(0);
  final PageController pageController = PageController();
  final DropDownController _dropDownController = Get.put(DropDownController());

  @override
  Widget build(BuildContext context) {
    final strings = Strings(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colours.Very_Light_Blue,
      endDrawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 2.633 * SizeConfig.heightMultiplier,
            ),
            for (int i = 0; i < 10; i++)
              Padding(
                padding:
                    EdgeInsets.only(left: 4.017 * SizeConfig.widthMultiplier),
                child: ListTile(
                  title: Text(
                    strings.drawer_items[i],
                    style: TextStyle(
                        fontSize: 2.212 * SizeConfig.heightMultiplier,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                        fontFamily: "Libre_Regular"),
                  ),
                  onTap: () {
                    i == 3
                        ? _navigateToPage(i)
                        : i == 4
                            ? _navigateToPage(i + 2)
                            : i == 5
                                ? _navigateToPage(i + 2)
                                : i == 6
                                    ? _navigateToPage(i + 2)
                                    : i == 7
                                        ? _navigateToPage(i + 2)
                                        : i == 8
                                            ? _navigateToPage(i + 3)
                                            : i == 9
                                                ? _navigateToPage(i + 4)
                                                : _navigateToPage(i);
                  },
                ),
              ),
            Obx(
              () => Padding(
                padding: EdgeInsets.only(
                    left: 7.700 * SizeConfig.widthMultiplier,
                    top: 1.1 * SizeConfig.heightMultiplier),
                child: GestureDetector(
                  onTap: () {
                    _dropDownController.isExpanded.value =
                        !_dropDownController.isExpanded.value;
                  },
                  child: Row(
                    children: [
                      _text("Select Language ", () {}),
                      _dropDownController.isExpanded.isTrue
                          ? Icon(
                              Icons.arrow_drop_up,
                              color: Colors.grey.shade800,
                              size: 3.581 * SizeConfig.heightMultiplier,
                            )
                          : Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey.shade800,
                              size: 3.581 * SizeConfig.heightMultiplier,
                            )
                    ],
                  ),
                ),
              ),
            ),
            Obx(
              () => _dropDownController.isExpanded.value
                  ? AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      color: Colours.Light_Blue,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 7.8 * SizeConfig.widthMultiplier,
                            top: 2 * SizeConfig.heightMultiplier),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _text("English", () {
                              _dropDownController.setLanguage('en');
                            }),
                            SizedBox(
                              height: 2 * SizeConfig.heightMultiplier,
                            ),
                            _text("हिन्दी", () {
                              _dropDownController.setLanguage('hi');
                            }),
                            SizedBox(
                              height: 2 * SizeConfig.heightMultiplier,
                            ),
                            _text("मराठी", () {
                              _dropDownController.setLanguage('mr');
                            }),
                            SizedBox(
                              height: 2 * SizeConfig.heightMultiplier,
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(),
            )
          ],
        ),
        width: 66.964 * SizeConfig.widthMultiplier,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colours.Very_Light_Blue,
      ),
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colours.Very_Light_Blue,
        toolbarHeight: 8.373 * SizeConfig.heightMultiplier,
        actions: [
          InkWell(
            onTap: (){
              Get.to(()=>ChatbotScreen(),transition: Transition.upToDown);
            },
            child: Image.asset("assets/chatbot.png",height: 50,width: 50,)),
          SizedBox(width:2,),
          IconButton(
            icon: Icon(
              Icons.menu,
              size: 5.266 * SizeConfig.heightMultiplier,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
          SizedBox(
            width: 1.339 * SizeConfig.widthMultiplier,
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
          Page3A(
            ontap: () {},
            pageIndex: 3,
            pageNotifier: pageNotifier,
          ),
          Page4(
            ontap: () {},
            pageIndex: 4,
            pageNotifier: pageNotifier,
          ),
          Page4A(ontap: () {}, pageIndex: 5, pageNotifier: pageNotifier),
          Page4B(ontap: () {}, pageIndex: 6, pageNotifier: pageNotifier),
          Page5(
            ontap: () {},
            pageIndex: 7,
            pageNotifier: pageNotifier,
          ),
          Page6(
            ontap: () {},
            pageIndex: 8,
            pageNotifier: pageNotifier,
          ),
          Page7(
            ontap: () {},
            pageIndex: 9,
            pageNotifier: pageNotifier,
          ),
          Page8(
            ontap: () {},
            pageIndex: 10,
            pageNotifier: pageNotifier,
          ),
          Page8A(
            ontap: () {},
            pageIndex: 11,
            pageNotifier: pageNotifier,
          ),
          Page8B(
            ontap: () {},
            pageIndex: 12,
            pageNotifier: pageNotifier,
          ),
          Page9(
            ontap: () {},
            pageIndex: 13,
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

Widget _text(String text, void Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Text(
      text,
      style: TextStyle(
          fontSize: 2.212 * SizeConfig.heightMultiplier,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade800,
          fontFamily: "Libre_Regular"),
    ),
  );
}
