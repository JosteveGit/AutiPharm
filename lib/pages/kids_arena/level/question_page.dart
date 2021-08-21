import 'package:auti_pharm/utils/functions/dev_utils.dart';
import 'package:auti_pharm/utils/functions/string_utils.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/widgets/pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.lock_clock_rounded),
                  SizedBox(width: 10),
                  Text(
                    "00:32",
                    style: TextStyle(
                      fontFamily: "Bubblegum",
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Color(0xffED7272),
                        fontFamily: "Bubblegum",
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 33),
              Text(
                "Which is your drug?",
                style: TextStyle(
                  fontFamily: "Bubblegum",
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Pill(size: 120)),
                      SizedBox(width: 10),
                      Center(child: Pill(size: 120)),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff88B5C4),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Pill(
                            color: Colors.blueGrey,
                            size: 70,
                          ),
                          Spacer(),
                          Pill(
                            color: Colors.green,
                            size: 70,
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Pill(
                            color: Colors.orange,
                            size: 70,
                          ),
                          Spacer(),
                          Pill(
                            size: 70,
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff88B5C4),
                    ),
                    borderRadius: BorderRadius.circular(16),
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
