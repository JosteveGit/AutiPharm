import 'package:auti_pharm/pages/kids_arena/kids_arena_dashboard_page.dart';
import 'package:auti_pharm/utils/functions/dev_utils.dart';
import 'package:auti_pharm/utils/functions/string_utils.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/child_image.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'view_child_page.dart';

class GuardiansDashboardPage extends StatefulWidget {
  const GuardiansDashboardPage({Key key}) : super(key: key);

  @override
  _GuardiansDashboardPageState createState() => _GuardiansDashboardPageState();
}

class _GuardiansDashboardPageState extends State<GuardiansDashboardPage> {
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    color: backgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Children",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 105,
                                  width: 107,
                                  child: Icon(
                                    Icons.add_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  decoration: BoxDecoration(
                                    color: overlayColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Add a child",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(width: 10),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    pushTo(context, ViewChildPage());
                                  },
                                  child: ChildImage(),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Josteve A.",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        DashboardOption(
                          iconData: Icons.person_rounded,
                          text: "Profile",
                        ),
                        DashboardOption(
                          iconData: Icons.settings_rounded,
                          text: "Settings",
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Divider(color: Color(0xff95C4D4)),
                  Spacer(),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kid's Arena",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          text: "Enter",
                          onPressed: () {
                            pushTo(context, KidsArenaDashboardPage());
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Image.asset(
                    pngPath("children"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DashboardOption extends StatelessWidget {
  final IconData iconData;
  final String text;
  const DashboardOption({
    Key key,
    this.iconData,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 26),
          Text(
            "$text",
          )
        ],
      ),
    );
  }
}
