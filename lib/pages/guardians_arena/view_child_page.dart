import 'package:auti_pharm/core/models/user/user_details.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/child_image.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'childs_history_page.dart';
import 'edit_childs_page.dart';

class ViewChildPage extends StatefulWidget {
  final Child child;
  const ViewChildPage({Key key, this.child}) : super(key: key);

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
                        "${widget.child.firstname} ${widget.child.lastname.substring(0, 1).toUpperCase()}.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        text: "Edit profile",
                        onPressed: () {
                          pushTo(context, EditChildsPage(child: widget.child,));
                        },
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
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        widget.child.milestones.length,
                        (index) {
                          HistoryDetails mileStone =
                              widget.child.milestones[index];
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  child: Container(
                                    padding: EdgeInsets.all(40),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.star_rounded,
                                            color: Colors.white),
                                        SizedBox(width: 4),
                                        Text(
                                          "${mileStone.level}${widget.child.levelOfUnderstanding.substring(0, 1).toUpperCase()}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'AirbnbCereal',
                                            fontSize: 30,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(Icons.star_rounded,
                                            color: Colors.white),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: backgroundColor, width: 2),
                                      color: overlayColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: overlayColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Level ${mileStone.level} - ${widget.child.levelOfUnderstanding}",
                                  style: TextStyle(),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "History",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                            ),
                            Spacer(),
                            CustomButton(
                              text: "View all history",
                              onPressed: () {
                                pushTo(
                                  context,
                                  ChildsHistoryPage(
                                    child: widget.child,
                                  ),
                                );
                              },
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 30,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Level",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: buttonColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Difficulty",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: buttonColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Score",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: buttonColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Time",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: buttonColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Column(
                            children: List.generate(
                          widget.child.shortHistory.length,
                          (index) {
                            HistoryDetails historyDetails =
                                widget.child.shortHistory[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Level ${historyDetails.level}",
                                      style: TextStyle(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${historyDetails.difficulty}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${historyDetails.score}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${historyDetails.time}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )),
                      ],
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
