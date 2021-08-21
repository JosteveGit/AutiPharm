import 'package:auti_pharm/utils/functions/dev_utils.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/child_image.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'level/question_page.dart';

class KidDashboardPage extends StatefulWidget {
  const KidDashboardPage({Key key}) : super(key: key);

  @override
  _KidDashboardPageState createState() => _KidDashboardPageState();
}

class _KidDashboardPageState extends State<KidDashboardPage> {
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
                "Hi, Josteve",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontFamily: 'Bubblegum',
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Kindly select a level and begin learnings.",
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              Container(
                height: 413,
                child: PageView(
                  controller: controller,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Expanded(child: Container()),
                          Text(
                            "Level 1",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Bubblegum',
                              fontSize: 45,
                            ),
                          ),
                          SizedBox(height: 5),
                          CustomButton(
                            text: "Start",
                            onPressed: () {
                              pushTo(context, QuestionPage());
                            },
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: overlayColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Expanded(child: Container()),
                          Text(
                            "Level 2",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Bubblegum',
                              fontSize: 45,
                            ),
                          ),
                          SizedBox(height: 5),
                          CustomButton(
                            text: "Locked",
                            onPressed: () {},
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: overlayColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomButton(
                expanded: true,
                text: "Exit Josteve's Arena",
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

  PageController controller = PageController(viewportFraction: 0.8);
}