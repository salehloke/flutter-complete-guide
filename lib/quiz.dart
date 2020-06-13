import 'package:flutter/material.dart';

import 'package:fluttercompleteguide/answer.dart';
import 'package:fluttercompleteguide/question.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questionList;
  final Function answerSequence;

  Quiz({this.questionIndex, this.questionList, this.answerSequence});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Question(questionList[questionIndex]["question"]),
            ...(questionList[questionIndex]["answer"] as List<Map<String,Object>>).map((
                answer) {
              return Answer(()=>answerSequence(answer["score"]), answer["text"]);
            }).toList(),
          ],
        ));
  }
}
