import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Strings2 {
  final BuildContext context;

  Strings2(this.context);

  static Locale app_locale = Locale('en');

  String get view_student_1 {
    return AppLocalizations.of(context)!.page_8a_views_1;
  }

  String get view_student_2 {
    return AppLocalizations.of(context)!.page_8a_views_2;
  }

  String get view_student_3 {
    return  AppLocalizations.of(context)!.page_8a_views_3;
  }

  String get view_doctor_1 {
    return AppLocalizations.of(context)!.page_8b_views_1;
  }

  String get view_doctor_2 {
    return AppLocalizations.of(context)!.page_8b_views_2;
  }

  String get view_doctor_3 {
    return AppLocalizations.of(context)!.page_8b_views_3;
  }

  String get page_2_title {
    return AppLocalizations.of(context)!.page_2_title;
  }

  String get page_2_desc {
    return AppLocalizations.of(context)!.page_2_desc;
  }

  String get page_7_title_1 {
    return AppLocalizations.of(context)!.page_7_title_1;
  }

  String get page_7_title_2 {
    return AppLocalizations.of(context)!.page_7_title_2;
  }
}

TextStyle style = TextStyle(
    letterSpacing: 1,
    fontFamily: "Libre_Regular",
    fontWeight: FontWeight.w600,
    fontSize: 2.001 * SizeConfig.heightMultiplier);

Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}
