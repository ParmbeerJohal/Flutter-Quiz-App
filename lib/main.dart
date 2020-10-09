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
  static const _questions = [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        'Black',
        'Red',
        'Green',
        'White',
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        'Dog',
        'Cat',
        'Rabbit',
        'Lion',
      ],
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': [
        'henry',
        'bob',
        'jack',
        'helen',
      ],
    },
  ];

  void _answerQuestion() {
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
            : Result(),
      ),
    );
  }
}
