import 'package:eme_corp/answer.dart';
import 'package:flutter/material.dart';
import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
    final questions = const [
    {
      'questionText': 'what\s your loved game?',
      'answer': ['cricket', 'football', 'badminton', 'tennis']
    },
    {
      'questionText': 'what\s your loved color?',
      'answer': ['red', 'green', 'yellow', 'pink']
    },
    {
      'questionText': 'what\s your loved os?',
      'answer': ['windows', 'mac osx', 'linux']
    }
  ];

  var questionIndex = 0;
  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( 
        appBar: AppBar(
          title: Text(
            'EME Corp',
          ),
        ),
        body: questionIndex < questions.length ? 
        Column
        (
          children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: Text(
              questions[questionIndex]['questionText'],
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
          ...(questions[questionIndex]['answer'] as List<String>).map((ans) {
            return Answer(answerQuestion, ans);
          }).toList(),
        ]) : Center(child: Text('You have done the assignment'),),
      ),
    );
  }
}
