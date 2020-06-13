import 'package:flutter/material.dart';
import 'package:fluttercompleteguide/question.dart';
import 'package:fluttercompleteguide/answer.dart';
import 'package:fluttercompleteguide/result.dart';
import 'package:fluttercompleteguide/quiz.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<_MyApp> {
  @override
  List<Map<String, Object>> _questionList = [
    {
      "question": "What is your fav animal?",
      "answer": [
        {"text": "Snake", "score": 10},
        {"text": "cat", "score": 8},
        {"text": "dog", "score": 5},
        {"text": "Rabbit", "score": 1},
      ]
    },
    {
      "question": "What is your fav color?",
      "answer": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 8},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1},
      ]
    },
    {
      "question": "What is your fav vehicle?",
      "answer": [
        {"text": "Truck", "score": 10},
        {"text": "Motorbike", "score": 8},
        {"text": "Car", "score": 3},
        {"text": "Bicycle", "score": 1},
      ]
    },
  ];
  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void answerSequence(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
      if (_questionIndex == _questionList.length) {
        print("okay");
      } else {
        print("more than array list");
      }
    });
    print("TotalScore: ${_totalScore}");
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('hello')),
        body: _questionIndex < _questionList.length
            ? Quiz(
                questionIndex: _questionIndex,
                questionList: _questionList,
                answerSequence: answerSequence)
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
