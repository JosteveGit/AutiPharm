import 'package:auti_pharm/core/models/user/user_details.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:flutter/material.dart';

class ChildsHistoryPage extends StatefulWidget {
  final Child child;
  const ChildsHistoryPage({Key key, this.child}) : super(key: key);

  @override
  _ChildsHistoryPageState createState() => _ChildsHistoryPageState();
}

class _ChildsHistoryPageState extends State<ChildsHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        pop(context);
                      },
                      child: Icon(Icons.arrow_back_rounded),
                    ),
                    Spacer(),
                    Text(
                      "History",
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Opacity(child: Icon(Icons.arrow_back_rounded), opacity: 0),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.child.firstname}'s History",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
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
              ),
              Divider(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
