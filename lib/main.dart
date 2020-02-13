import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

//entry point
void main() {
  var app = MyApp();
  runApp(app);
}

//main class for App
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

//State is a generic class.
//State belong to MyApp class.
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    //build is call again?
    setState(() {
      _questionIndex++;
    });
    print('Answer chosen!');
  }

  @override
  Widget build(BuildContext ctx) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'Pink'],
      },
      {
        'questionText': 'What\'s your favorite color?2',
        'answers': ['Black', 'Red', 'Green', 'Pink'],
      },
      {
        'questionText': 'What\'s your favorite color?3',
        'answers': ['Black', 'Red', 'Green', 'Pink'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Question(
              questions[_questionIndex]['questionText']
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion,answer);
            }).toList()
          ],
        ),
      ),
    );
  }
  //provide widget created by flutter
}
