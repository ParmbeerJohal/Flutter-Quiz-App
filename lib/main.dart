import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyPilotApp());
}

class MyPilotApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyPilotAppState();
  }
}

class _MyPilotAppState extends State<MyPilotApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  static const _questions = [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {
          'text': 'Black',
          'score': 5,
        },
        {
          'text': 'White',
          'score': 3,
        },
        {
          'text': 'Red',
          'score': 10,
        },
        {
          'text': 'Blue',
          'score': 8,
        },
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {
          'text': 'Dog',
          'score': 8,
        },
        {
          'text': 'Cat',
          'score': 1,
        },
        {
          'text': 'Lion',
          'score': 10,
        },
        {
          'text': 'Monkey',
          'score': 5,
        },
      ],
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': [
        {
          'text': 'Michael Zastre',
          'score': 4,
        },
        {
          'text': 'Bill Bird',
          'score': 6,
        },
        {
          'text': 'Venkatesh Srinivasen',
          'score': 8,
        },
        {
          'text': 'Alex Thomo',
          'score': 10,
        },
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First Pilot App!'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
