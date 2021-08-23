import 'dart:async';
import 'dart:math';

import 'package:auti_pharm/core/models/question_details.dart';
import 'package:auti_pharm/core/models/user/user_details.dart';
import 'package:auti_pharm/services/question/question_service.dart';
import 'package:auti_pharm/utils/functions/dev_utils.dart';
import 'package:auti_pharm/utils/functions/dialog_utils.dart';
import 'package:auti_pharm/utils/functions/string_utils.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:auti_pharm/utils/widgets/pill.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  final Child child;
  final int type;
  const QuestionPage({Key key, this.child, this.type}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  void initState() {
    super.initState();
    type = widget.type;
    questions = generateQuestions(widget.type);
    countUpTimer();
  }

  List<QuestionDetails> questions;

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
                    "${zeroPrefixNumber(time.minute)}:${zeroPrefixNumber(time.second)}",
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
                "Identify your drug?",
                style: TextStyle(
                  fontFamily: "Bubblegum",
                  fontSize: 35,
                ),
              ),
              Expanded(
                child: Builder(builder: (context) {
                  QuestionDetails questionDetails = questions[questionIndex];
                  return Column(
                    children: [
                      SizedBox(height: 15),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              questionDetails.answer.length,
                              (index) {
                                return Center(
                                  child: Pill(
                                    color: questionDetails.answer[index],
                                    size: 100,
                                  ),
                                );
                              },
                            ),
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
                                  QuestionSelector(
                                    questions: questions,
                                    questionIndex: questionIndex,
                                    type: type,
                                    optionIndex: 0,
                                    onTap: () {
                                      onSelected(0);
                                    },
                                  ),
                                  Spacer(),
                                  QuestionSelector(
                                    questions: questions,
                                    questionIndex: questionIndex,
                                    type: type,
                                    optionIndex: 1,
                                    onTap: () {
                                      onSelected(1);
                                    },
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  QuestionSelector(
                                    questions: questions,
                                    questionIndex: questionIndex,
                                    type: type,
                                    optionIndex: 2,
                                    onTap: () {
                                      onSelected(2);
                                    },
                                  ),
                                  Spacer(),
                                  QuestionSelector(
                                    questions: questions,
                                    questionIndex: questionIndex,
                                    type: type,
                                    optionIndex: 3,
                                    onTap: () {
                                      onSelected(3);
                                    },
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
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int numberOfTrials = 0;

  void onSelected(int optionIndex) async {
    QuestionDetails questionDetails = questions[questionIndex];
    if (optionIndex == questionDetails.answerIndex) {
      int numberOfStars = 3 - numberOfTrials;
      if (numberOfStars < 0) {
        numberOfStars = 0;
      }
      if (questionIndex == 9) {
        timer.cancel();
      }
      await showDialog(
        context: context,
        builder: (_) => CorrectDialog(numberOfStars: numberOfStars),
      );
      if (questionIndex == 9) {
        int allStars = numbersOfStars.reduce((a, b) => a + b);

        await showDialog(
          context: context,
          builder: (_) => CompletionDialog(
            allStars: allStars,
            type: widget.type,
            child: widget.child,
          ),
        );
        showLoader(context);
        await QuestionService.pushResult(
          child: widget.child,
          level: widget.type,
          time: "${time.minute}min ${time.second}sec",
          score: "$allStars/30",
        );
        pop(context);
        pop(context);
      } else {
        moveToNext(numberOfStars);
      }
    } else {
      numberOfTrials++;
    }
  }

  List<int> numbersOfStars = [];

  void moveToNext(int numberOfStars) {
    numbersOfStars.add(numberOfStars);
    numberOfTrials = 0;
    setState(() {
      questionIndex++;
    });
  }

  Timer timer;

  void countUpTimer() {
    time = DateTime(0);
    if (timer != null) {
      timer.cancel();
    }
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (mounted) {
          setState(() {
            time = time.add(Duration(seconds: 1));
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  DateTime time = DateTime(0);

  int type;
  int questionIndex = 0;

  List<QuestionDetails> generateQuestions(int type) {
    List<Color> possibleColors = [
      ...Colors.primaries,
      ...Colors.accents,
    ];
    List<QuestionDetails> questions = [];
    for (int i = 0; i < 10; i++) {
      //We want to generate;
      List<List<Color>> options = [];
      for (int k = 0; k < 4; k++) {
        //Each option
        List<Color> colors = [];
        for (int j = 0; j < type; j++) {
          int random = Random().nextInt(possibleColors.length);
          colors.add(possibleColors[random]);
        }
        options.add(colors);
      }

      int answer = Random().nextInt(options.length);
      questions.add(
        QuestionDetails(
          type: type,
          options: options,
          answerIndex: answer,
          answer: options[answer],
        ),
      );
    }
    return questions;
  }
}

class CorrectDialog extends StatelessWidget {
  final int numberOfStars;
  const CorrectDialog({Key key, this.numberOfStars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 350,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) {
                  return Container(
                    child: Icon(
                      numberOfStars >= (index + 1)
                          ? Icons.star_rounded
                          : Icons.star_border_rounded,
                      size: 80,
                      color: Color(0xffFDD835),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Correct",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'AirbnbCereal',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: "Next",
              onPressed: () {
                pop(context);
              },
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

class CompletionDialog extends StatelessWidget {
  final int allStars;
  final int type;
  final Child child;
  const CompletionDialog({Key key, this.allStars, this.child, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 450,
        width: 230,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "Level\nCompleted",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'AirbnbCereal',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "You’ve earned a milestone badge",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w200,
                fontFamily: 'AirbnbCereal',
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Color(0xffFDD835),
                  size: 30,
                ),
                SizedBox(width: 4),
                Text(
                  "$allStars/30",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(3),
              child: Container(
                padding: EdgeInsets.all(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_rounded, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      "$type${child.levelOfUnderstanding.substring(0, 1).toUpperCase()}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'AirbnbCereal',
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.star_rounded, color: Colors.white),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: backgroundColor, width: 2),
                  color: overlayColor,
                  shape: BoxShape.circle,
                ),
              ),
              decoration: BoxDecoration(
                color: overlayColor,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: "Next",
              onPressed: () {
                pop(context);
              },
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

class QuestionSelector extends StatelessWidget {
  const QuestionSelector(
      {Key key,
      @required this.questions,
      @required this.questionIndex,
      @required this.type,
      @required this.optionIndex,
      @required this.onTap})
      : super(key: key);

  final List<QuestionDetails> questions;
  final int questionIndex;
  final int type;
  final int optionIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: List.generate(
          questions[questionIndex].options[optionIndex].length,
          (index) {
            Color color = questions[questionIndex].options[optionIndex][index];
            return Pill(
              color: color,
              size: 70.0 - (type * 10),
            );
          },
        ),
      ),
    );
  }
}
