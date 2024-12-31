import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pillbin/styling/strings/strings_2.dart';

class DropDownController extends GetxController {
  //* for selecteing dropItem
  RxString? selectedValue;
  //* for collapse/open of dropDown
  RxBool isExpanded = false.obs;

  //* for selecting languae
  void setLanguage(lang) {
    Strings2.app_locale = Locale(lang);
    Get.updateLocale(Strings2.app_locale);
    isExpanded = false.obs;
  }

}