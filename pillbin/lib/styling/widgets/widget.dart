import 'package:flutter/material.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';

Widget dropDownItem(String title, String image) {
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            Image.asset(
              image,
              height: 3.16 * SizeConfig.heightMultiplier,
              width: 6.69 * SizeConfig.widthMultiplier,
            ),
            SizedBox(
              width: 2.23 * SizeConfig.widthMultiplier,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 2.40 * SizeConfig.heightMultiplier,
                  color: Colors.black,
                  fontFamily: "CoreSansBold"),
            )
          ],
        ),
        SizedBox(
          height: 0.52 * SizeConfig.heightMultiplier,
        ),
        Divider(
          color: Colors.black,
          height: 5,
        )
      ],
    ),
  );
}
