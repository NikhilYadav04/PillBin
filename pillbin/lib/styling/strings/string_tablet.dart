import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StringsTablet {
  final BuildContext context;
  StringsTablet(this.context);

  List<String> get drawer_items {
    return [
      AppLocalizations.of(context)!.drawer_1,
      AppLocalizations.of(context)!.drawer_2,
      AppLocalizations.of(context)!.drawer_3,
      AppLocalizations.of(context)!.drawer_4,
      AppLocalizations.of(context)!.drawer_5,
      AppLocalizations.of(context)!.drawer_6,
      AppLocalizations.of(context)!.drawer_7,
      AppLocalizations.of(context)!.drawer_8,
      AppLocalizations.of(context)!.drawer_9,
      AppLocalizations.of(context)!.drawer_10,
    ];
  }

  String get page_5_title_1 {
    return AppLocalizations.of(context)!.page_5_title_1;
  }

  String get page_5_title_2 {
    return AppLocalizations.of(context)!.page_5_title_2;
  }

  String get page_5_title_3 {
    return AppLocalizations.of(context)!.page_5_title_3;
  }

  String get page_5_title_4 {
    return AppLocalizations.of(context)!.page_5_title_4;
  }

  List<String> get rules_strict {
    return [
      AppLocalizations.of(context)!.page_5_rules_strict_1,
      AppLocalizations.of(context)!.page_5_rules_strict_2,
      AppLocalizations.of(context)!.page_5_rules_strict_3,
      AppLocalizations.of(context)!.page_5_rules_strict_4,
    ];
  }

  List<String> get rules_desc {
    return [
      AppLocalizations.of(context)!.page_5_rules_desc_1,
      AppLocalizations.of(context)!.page_5_rules_desc_2,
      AppLocalizations.of(context)!.page_5_rules_desc_3,
      AppLocalizations.of(context)!.page_5_rules_desc_4,
    ];
  }

  String get page_6_title_1 {
    return AppLocalizations.of(context)!.page_6_title_1;
  }

  String get page_6_title_2 {
    return AppLocalizations.of(context)!.page_6_title_2;
  }

  List<String> get drug_title {
    return [
      AppLocalizations.of(context)!.page_6_rules_strict_1,
      AppLocalizations.of(context)!.page_6_rules_strict_2,
      AppLocalizations.of(context)!.page_6_rules_strict_3,
    ];
  }

  List<String> get drug_desc {
    return [
      AppLocalizations.of(context)!.page_6_rules_desc_1,
      AppLocalizations.of(context)!.page_6_rules_desc_2,
      AppLocalizations.of(context)!.page_6_rules_desc_3,
    ];
  }

  String get page_3_title {
    return AppLocalizations.of(context)!.page_3_title;
  }

  RichText get drug {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: AppLocalizations.of(context)!.page_3_desc_1,
            style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3_desc_2,
            style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3_desc_3,
            style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3_desc_4,
            style: style.copyWith(color: Colors.black)),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3_desc_5,
            style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3_desc_6,
            style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3_desc_7,
            style: style.copyWith(color: Colors.black)),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3_desc_8,
            style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3_desc_9,
            style: style.copyWith(color: Colors.black)),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3_desc_10,
            style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76)))
      ]),
    );
  }

  String get know_more {
    return AppLocalizations.of(context)!.page_3a_desc_5;
  }

  RichText get drug_risks {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: AppLocalizations.of(context)!.page_3a_desc_1,
            style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3a_desc_2,
            style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3a_desc_3,
            style: style.copyWith(color: Colors.black)),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3a_desc_4,
            style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3a_desc_5,
            style: style.copyWith(
                color: Colors.black,
                decoration: TextDecoration.underline,
                decorationThickness: 2),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                _launchUrl("https://www.pnas.org/doi/10.1073/pnas.2113947119");
              }),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3a_desc_6,
            style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
        TextSpan(
          text: AppLocalizations.of(context)!.page_3a_desc_7,
          style: style.copyWith(
              color: Colors.black,
              decoration: TextDecoration.underline,
              decorationThickness: 2),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              _launchUrl(
                  "https://www.who.int/news-room/fact-sheets/detail/antimicrobial-resistance");
            },
        ),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3a_desc_8,
            style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
        TextSpan(
            text: AppLocalizations.of(context)!.page_3a_desc_9,
            style: style.copyWith(color: Colors.black)),
        TextSpan(
          text: AppLocalizations.of(context)!.page_3a_desc_10,
          style: style.copyWith(
              color: Colors.black,
              decoration: TextDecoration.underline,
              decorationThickness: 2),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              _launchUrl(
                  "https://www.unep.org/resources/superbugs/environmental-action?gad_source=1&gclid=CjwKCAiAxreqBhAxEiwAfGfndDM_RbrPl9C9og4VhP0OgfRrDt9xpRaC-0VpiXPgpfkgi1zLxayKwRoCoEUQAvD_BwE");
            },
        ),
      ]),
    );
  }

  String get page_4_title_1 {
    return AppLocalizations.of(context)!.page_4_title_1;
  }

  String get page_4_title_2 {
    return AppLocalizations.of(context)!.page_4_title_2;
  }

  String get page_4_title_3 {
    return AppLocalizations.of(context)!.page_4_title_3;
  }

  RichText get impact {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: AppLocalizations.of(context)!.page_4_desc_1,
          style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4_desc_2,
          style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
      TextSpan(
        text: AppLocalizations.of(context)!.page_4_desc_3,
        style: style.copyWith(
            color: Color.fromARGB(255, 78, 76, 76),
            decoration: TextDecoration.underline,
            decorationThickness: 2),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            _launchUrl(
                "https://www.researchgate.net/publication/228008880_Diclofenac_Poisoning_as_a_Cause_of_Vulture_Population_Declines_across_the_Indian_Subcontinent");
          },
      ),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4_desc_4,
          style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4_desc_5,
          style: style.copyWith(color: Colors.black)),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4_desc_6,
          style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
      TextSpan(text: "97%. ", style: style.copyWith(color: Colors.black)),
      TextSpan(
        text: AppLocalizations.of(context)!.page_4_desc_7,
        style: style.copyWith(
            color: Color.fromARGB(255, 78, 76, 76),
            decoration: TextDecoration.underline,
            decorationThickness: 2),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            _launchUrl(
                "https://www.sciencehistory.org/stories/magazine/poison-pill-the-mysterious-die-off-of-indias-vultures/");
          },
      ),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4_desc_8,
          style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76)))
    ]));
  }

  String get page_4a_title {
    return AppLocalizations.of(context)!.page_4a_title;
  }

  RichText get effect {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: AppLocalizations.of(context)!.page_4a_desc_1,
          style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4a_desc_2,
          style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4a_desc_3,
          style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
      TextSpan(
        text: AppLocalizations.of(context)!.page_4a_desc_4,
        style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76)),
      ),
      TextSpan(
        text: AppLocalizations.of(context)!.page_4a_desc_5,
        style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76)),
      ),
      TextSpan(
        text: AppLocalizations.of(context)!.page_4a_desc_6,
        style: style.copyWith(
            color: Color.fromARGB(255, 78, 76, 76),
            decoration: TextDecoration.underline,
            decorationThickness: 2),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            _launchUrl("https://pubmed.ncbi.nlm.nih.gov/12651186/");
          },
      ),
    ]));
  }

  RichText get survey {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: AppLocalizations.of(context)!.page_4b_desc_1,
        style: style.copyWith(color: Colors.black),
      ),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4b_desc_2,
          style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4b_desc_3,
          style: style.copyWith(color: Colors.black)),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4b_desc_4,
          style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4b_desc_5,
          style: style.copyWith(color: Colors.black)),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4b_desc_6,
          style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4b_desc_7,
          style: style.copyWith(color: Colors.black)),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4b_desc_9,
          style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76))),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4b_desc_10,
          style: style.copyWith(color: Colors.black)),
      TextSpan(
          text: AppLocalizations.of(context)!.page_4b_desc_11,
          style: style.copyWith(color: Color.fromARGB(255, 78, 76, 76)))
    ]));
  }

  String get survey_2 {
    return AppLocalizations.of(context)!.page_4b_desc_detail;
  }
}

TextStyle style = TextStyle(
    letterSpacing: 1,
    fontFamily: "Libre_Regular",
    fontWeight: FontWeight.w600,
    fontSize: 2.2 * SizeConfig.heightMultiplier);

Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}
