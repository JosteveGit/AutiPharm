import 'package:auti_pharm/core/models/user/user_details.dart';
import 'package:auti_pharm/utils/functions/dev_utils.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:auti_pharm/utils/widgets/pill.dart';
import 'package:flutter/material.dart';

import 'level/question_page.dart';

class KidDashboardPage extends StatefulWidget {
  final Child child;
  const KidDashboardPage({
    Key key,
    this.child,
  }) : super(key: key);

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
                "Hi, ${widget.child.firstname}",
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
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Pill(
                                    size: 150,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                              pushTo(
                                context,
                                QuestionPage(child: widget.child, type: 1),
                              );
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
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Pill(
                                      size: 80,
                                    ),
                                    SizedBox(width: 20),
                                    Pill(
                                      size: 80,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
                            text: widget.child.milestones
                                        .where((element) => element.level == 1)
                                        .length ==
                                    0
                                ? "Locked"
                                : "Start",
                            onPressed: () {
                              if (widget.child.milestones
                                      .where((element) => element.level == 1)
                                      .length !=
                                  0) {
                                pushTo(
                                  context,
                                  QuestionPage(child: widget.child, type: 2),
                                );
                              }
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
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Wrap(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Pill(
                                          size: 80,
                                        ),
                                        SizedBox(width: 20),
                                        Pill(
                                          size: 80,
                                          color: Colors.blue,
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20),
                                    Center(
                                      child: Pill(
                                        size: 80,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Level 3",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Bubblegum',
                              fontSize: 45,
                            ),
                          ),
                          SizedBox(height: 5),
                          CustomButton(
                            text: widget.child.milestones
                                        .where((element) => element.level == 2)
                                        .length ==
                                    0
                                ? "Locked"
                                : "Start",
                            onPressed: () {
                              if (widget.child.milestones
                                      .where((element) => element.level == 2)
                                      .length !=
                                  0) {
                                pushTo(
                                  context,
                                  QuestionPage(child: widget.child, type: 3),
                                );
                              }
                            },
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
                text: "Exit ${widget.child.firstname}'s Arena",
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
