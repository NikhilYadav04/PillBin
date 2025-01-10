import 'package:flutter/material.dart';
import 'package:pillbin/screens/about_us/page_2_tablet.dart';
import 'package:pillbin/screens/disposal/page_7_tablet.dart';
import 'package:pillbin/screens/drug_disposal/page3_tablet.dart';
import 'package:pillbin/screens/intro/page_1_tablet.dart';
import 'package:pillbin/screens/know-more/page_9_tablet.dart';
import 'package:pillbin/screens/reasons/page_5_tablet.dart';
import 'package:pillbin/screens/risks/page_3_a_tablet.dart';
import 'package:pillbin/screens/survey/page_4_tablet.dart';
import 'package:pillbin/screens/take-back/page_6_tablet.dart';
import 'package:pillbin/screens/views/page_8_tablet.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';

class RootScreenTablet extends StatefulWidget {
  const RootScreenTablet({super.key});

  @override
  State<RootScreenTablet> createState() => _RootScreenTabletState();
}

class _RootScreenTabletState extends State<RootScreenTablet>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colours.Very_Light_Blue,
      body: Column(
        children: [
          Container(
            height: 100,
            child: TabBar(
                padding: EdgeInsets.only(bottom: 5),
                indicatorColor: Colours.Light_Blue,
                controller: _tabController,
                tabs: [
                  Tab(
                    child: FittedBox(child: Text(AppLocalizations.of(context)!.drawer_1, style: style)),
                  ),
                  Tab(
                    child: FittedBox(child: Text(AppLocalizations.of(context)!.drawer_2, style: style)),
                  ),
                  Tab(
                    child: FittedBox(child: Text(AppLocalizations.of(context)!.drawer_3_tablet, style: style)),
                  ),
                  Tab(
                    child: FittedBox(child: Text(AppLocalizations.of(context)!.drawer_4, style: style)),
                  ),
                  Tab(
                    child: FittedBox(child: Text(AppLocalizations.of(context)!.drawer_5, style: style)),
                  ),
                  Tab(
                    child: FittedBox(child: Text(AppLocalizations.of(context)!.drawer_6_tablet, style: style)),
                  ),
                  Tab(
                    child: FittedBox(child: Text(AppLocalizations.of(context)!.drawer_7_tablet, style: style)),
                  ),
                  Tab(
                    child: FittedBox(child: Text(AppLocalizations.of(context)!.drawer_8_tablet, style: style)),
                  ),
                  Tab(child: FittedBox(child: Text(AppLocalizations.of(context)!.drawer_9, style: style))),
                  Tab(
                    child: FittedBox(child: Text(AppLocalizations.of(context)!.drawer_10_tablet, style: style)),
                  )
                ]),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              Page1Tablet(
                onTap: (){
                  _tabController.animateTo(1);
                },
              ),
              Page2Tablet(),
              Page3Tablet(),
              Page3ATablet(),
              Page4Tablet(),
              Page5Tablet(),
              Page6Tablet(),
              Page7Tablet(),
              Page8Tablet(),
              Page9Tablet(),
            ]),
          )
        ],
      ),
    ));
  }
}

final style = TextStyle(
    fontSize: 2.25 * SizeConfig.heightMultiplier,
    fontWeight: FontWeight.bold,
    color: Colors.grey.shade800,
    fontFamily: "Libre_Regular");
