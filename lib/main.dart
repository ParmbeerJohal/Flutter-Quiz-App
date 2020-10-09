import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  static const questions = [
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
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'],
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList(),
                ],
              )
            : Center(
                child: Text(
                  'You did it!',
                  textScaleFactor: 3.0,
                ),
              ),
      ),
    );
  }
}
