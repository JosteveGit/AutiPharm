import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/child_image.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ViewChildPage extends StatefulWidget {
  const ViewChildPage({Key key}) : super(key: key);

  @override
  _ViewChildPageState createState() => _ViewChildPageState();
}

class _ViewChildPageState extends State<ViewChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: backgroundColor,
              width: double.maxFinite,
              padding: EdgeInsets.all(30),
              child: Row(
                children: [
                  ChildImage(),
                  SizedBox(width: 21),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Josteve A.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        text: "Edit profile",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Milestones",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        4,
                        (index) {
                          return Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 136,
                                  width: 136,
                                  decoration: BoxDecoration(
                                    color: overlayColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Level 3 - Low",
                                  style: TextStyle(),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
