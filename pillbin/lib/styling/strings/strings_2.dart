import 'dart:ui';

import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:url_launcher/url_launcher.dart';

class Strings2{

  Strings2._();

  static String  view_student_1 = "I believe if we initially give only the required/needed amount of medicines instead of extras the wastage of meds can be reduced. Also about the drug disposal i believe there should be a community set up at every city level to collect the old expired meds from every house this way the disposal will be carried out in correct way rather than the non medico people who do not have correct info of how to dispose meds.";
  static String view_student_2 = "To improve drug disposal practices, local communities can establish more accessible drop-off points at pharmacies, healthcare facilities, and police stations, ensuring safe disposal methods. Public education campaigns can raise awareness about the dangers of improper disposal and promote the use of mail-back programs and take-back events. Additionally, increasing collaboration with waste management services to ensure secure incineration or recycling can reduce environmental impact.";
  static String view_student_3 = "The Best way as per me is to guide the pharmacist and tell them to make general public aware of any such schemes or guidelines of the Government for disposing the medicines, of there will be some incentives while returning the same to them the General public will be surely following. Government if possible can run ads on TV or Social Media or BEST buses and Local train so that it can it can come to their notice. Medicine Disposer Box a special dustbin near Pharmacies where people if it's locality can dispose their Leftover or Unused medications.";

  static String view_doctor_1 = "Pharmacist should collect even expired medicine and from them disposal system should function";
  static String view_doctor_2 = "1. Check medicine cabinet and gather all expired unused medications.\n2. Take them to a nearby  pharmacy for safe disposal. ";
  static String view_doctor_3 = "Every society should have separate drug collection bin like dust bin.";

  static String about_us = "I am an undergraduate Pharmacy student who is passionate about environmental issues. When I learned about environmental hazards from expired and/or unused medicines, I decided to investigate this issue. Hence, a survey was conducted to evaluate the community's knowledge with respect to drug disposal awareness. The survey showed that the majority of people have many unused or expired medicines at household level, and they are unaware of drug disposal methods as well as environmental hazards associated with them. The goal of this website is to educate the public on safe disposal practices, raise awareness about the environmental impact of improper drug disposal, and provide resources to prevent pharmaceutical pollution. By sharing knowledge and promoting responsible actions, we should aim to protect our environment and ensure a healthier future.";
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