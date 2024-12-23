import 'package:flutter/material.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/images/images.dart';

class Page7 extends StatefulWidget {
  const Page7({super.key,required this.ontap, required this.pageIndex, required this.pageNotifier});
    final void Function() ontap;
  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 500,
            child: Stack(
              fit: StackFit.expand,
              children: [
                //* Blue Card
                FractionallySizedBox(
                  heightFactor: 0.7,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 100),
                    child: Container(
                      decoration: BoxDecoration(color: Colours.Light_Blue),
                    ),
                  ),
                ),

                //*Photo
                FractionallySizedBox(
                  heightFactor: 0.7,
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 125),
                      child: ClipRRect(
                        child: Image.asset(
                          Images.Image_5,
                          scale: 1.15,
                        ),
                      )),
                ),

                //*Text
                FractionallySizedBox(
                  heightFactor: 0.26,
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Drug Disposal\nMethods",
                          style: TextStyle(
                              fontFamily: "Libre_Bold",
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 0,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Flush Drugs",style: TextStyle(fontFamily: "Libre_Regular",fontWeight: FontWeight.bold,fontSize: 35),)),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Medicine Disposal Guidelines",style: TextStyle(fontFamily: "Libre_Regular",fontWeight: FontWeight.bold,fontSize: 22),)),
          ),
           SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("1. Follow Healthcare Provider Instructions",style: TextStyle(fontFamily: "Libre_Regular",fontWeight: FontWeight.bold,fontSize: 18),)),
          ),
           SizedBox(height: 8,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("   Dispose of unused or expired medicines as directed by your doctor or pharmacist.",style: TextStyle(fontFamily: "Libre_Regular",fontWeight: FontWeight.bold,fontSize: 16.5,color: Color.fromARGB(255, 78, 76, 76)),)),
          ),
          SizedBox(height: 25,),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("2. Preferred Disposal Methods",style: TextStyle(fontFamily: "Libre_Regular",fontWeight: FontWeight.bold,fontSize: 18),)),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Use a drug take-back option",style: TextStyle(fontFamily: "Libre_Regular",fontWeight: FontWeight.bold,fontSize: 18),)),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("  • Drop off medicines at an authorized take-back location\n  • Mail them using a pre-paid drug mail-back envelope."
              ,style: TextStyle(fontFamily: "Libre_Regular",fontWeight: FontWeight.bold,fontSize: 16,color: Color.fromARGB(255, 78, 76, 76)),)),
          ),
           SizedBox(height: 25,),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("3. Check the FDA's Flush List",style: TextStyle(fontFamily: "Libre_Regular",fontWeight: FontWeight.bold,fontSize: 18),)),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(" If take-back options are unavailable, verify if the medicine is on the FDA’s Flush List. Only flush medicines that:",style: TextStyle(fontFamily: "Libre_Regular",fontWeight: FontWeight.bold,fontSize: 16.5,color: Color.fromARGB(255, 78, 76, 76)),)),
          ),
          SizedBox(height: 5,),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(" • Have high misuse or abuse potential.\n • Can cause death from a single dose if improperly used..",style: TextStyle(fontFamily: "Libre_Regular",fontWeight: FontWeight.bold,fontSize: 16.5,color: Color.fromARGB(255, 78, 76, 76)),)),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Important Reminder",style: TextStyle(fontFamily: "Libre_Regular",fontWeight: FontWeight.bold,fontSize: 19),)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Do not flush medicines unless they are explicitly listed on the FDA's Flush List.",style: TextStyle(fontFamily: "Libre_Regular",fontWeight: FontWeight.bold,fontSize: 19),)),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
