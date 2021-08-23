import 'package:flutter/material.dart';

class QuestionDetails {
  final int type;
  final List<Color> answer;
  final List<List<Color>> options;
  final int answerIndex;

  QuestionDetails({this.type, this.answer, this.options, this.answerIndex});

  @override
  String toString() {
    return 'QuestionDetails(type: $type, answer: $answer, options: $options)';
  }
}
