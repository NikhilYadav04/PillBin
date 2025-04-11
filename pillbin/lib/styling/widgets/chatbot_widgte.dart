import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pillbin/controller/GetX_report.dart';
import 'package:pillbin/services/reportService.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:pillbin/styling/widgets/toast.dart';

Widget reportCard(BuildContext context, GetxReport controller, String question,
    String response, ReportService service) {
  return Container(
    height: 47.4017 * SizeConfig.heightMultiplier,
    padding: EdgeInsets.symmetric(
        horizontal: 3.34821 * SizeConfig.widthMultiplier,
        vertical: 3.160113 * SizeConfig.heightMultiplier),
    child: Column(
      children: [
        SizedBox(
          height: 31.6012 * SizeConfig.heightMultiplier,
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: (controller.spam.length / 2).ceil(),
              itemBuilder: (context, index) {
                final first = controller.spam[index * 2];
                final second = (index * 2 + 1 < controller.spam.length)
                    ? controller.spam[index * 2 + 1]
                    : null;

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: cardDisplay(
                      first,
                      second,
                      () => controller.changeStatus(first),
                      () => controller.changeStatus(second),
                      controller),
                );
              }),
        ),
        SizedBox(
          height: 2.63343 * SizeConfig.heightMultiplier,
        ),
        SizedBox(
          height: 6.32024 * SizeConfig.heightMultiplier,
          width: 85.17857 * SizeConfig.widthMultiplier,
          child: ElevatedButton(
            onPressed: () async {
              final response_string = await service.reportResponse(
                  question, response, controller.status.value);

              if (response_string.startsWith("Error")) {
                toastErrorSlide(
                    context, "Error Reporting Response, Please Try Again !!");
                Navigator.pop(context, false);
              } else {
                toastSuccessSlide(context, response_string);
                Navigator.pop(context, true);
              }

              //Navigator.pop(context,true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    2.6334278 * SizeConfig.heightMultiplier),
              ),
            ),
            child: Center(
              child: Text(
                "Report",
                style: TextStyle(
                  fontSize: 3.26545 * SizeConfig.heightMultiplier,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget cardDisplay(String title1, String title2, void Function() onTap1,
    void Function() onTap2, GetxReport controller) {
  return Row(
    children: [
      Expanded(flex: 1, child: card(title1, onTap1, controller)),
      Expanded(flex: 1, child: card(title2, onTap2, controller)),
    ],
  );
}

Widget card(String text, void Function() onTap, GetxReport controller) {
  return Obx(
    () => GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 2.23214 * SizeConfig.widthMultiplier),
        child: Container(
          height: 8.426969 * SizeConfig.heightMultiplier,
          width: 13.3928 * SizeConfig.widthMultiplier,
          decoration: BoxDecoration(
              color: controller.status == text
                  ? Color.fromARGB(255, 46, 172, 240)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color.fromARGB(255, 46, 172, 240))),
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 1.7857 * SizeConfig.widthMultiplier),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 1.89607 * SizeConfig.heightMultiplier,
                    color: controller.status == text
                        ? Colors.white
                        : Color.fromARGB(255, 53, 174, 239)),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
