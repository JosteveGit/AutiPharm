import 'package:auti_pharm/core/constants.dart';
import 'package:auti_pharm/core/models/user/user_details.dart';
import 'package:auti_pharm/pages/guardians_arena/view_child_page.dart';
import 'package:auti_pharm/pages/kids_arena/level/question_page.dart';
import 'package:auti_pharm/utils/functions/dev_utils.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/child_image.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'kid_dashboard_page.dart';

class KidsArenaDashboardPage extends StatefulWidget {
  const KidsArenaDashboardPage({Key key}) : super(key: key);

  @override
  _KidsArenaDashboardPageState createState() => _KidsArenaDashboardPageState();
}

class _KidsArenaDashboardPageState extends State<KidsArenaDashboardPage> {
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.white);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to\nAutiPharm Kid’s\nArena",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontFamily: 'Bubblegum',
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Kindly select who is learning",
                style: TextStyle(color: Colors.white),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      child: Wrap(
                        children: [
                          
                          ...List.generate(
                            userDetails.details.children.length,
                            (index) {
                              Child child = userDetails.details.children[index];
                              return Container(
                                margin: EdgeInsets.only(right: 10, bottom: 10),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        pushTo(
                                          context,
                                          KidDashboardPage(child: child),
                                        );
                                      },
                                      child: ChildImage(),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "${child.firstname} ${child.lastname.substring(0, 1)}.",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                expanded: true,
                text: "Exit Arena",
                onPressed: () {
                  pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
