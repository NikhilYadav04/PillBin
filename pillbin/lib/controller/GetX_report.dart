import 'package:get/get.dart';

class GetxReport extends GetxController {
  //* list of spams
  RxList spam = [
    "Inappropriate",
    "Spam or Misleading",
    "False Information",
    "Sexual or Violent",
    "Hate Speech",
    "Offensive or Abusive"
  ].obs;

  RxString status = "Inappropriate".obs;

  void changeStatus(String type) {
    status.value = type;
    update();
  }
}
