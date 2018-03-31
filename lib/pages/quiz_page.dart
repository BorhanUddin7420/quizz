import 'package:flutter/material.dart';

import '../utls/question.dart';
import '../utls/quiz.dart';
import '../UI/answerbutton.dart';

class QuizPage extends StatefulWidget{
@override
State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage>{
  @override
  Widget build(BuildContext context){
    return new Stack(
      children: <Widget>[
        new Column( // this is our main Page
        children: <Widget>[
          new AnswerButton(true, () => print("You Annswered True")),
          new AnswerButton(false, () => print("You Annswered False")),
        ],

        ),
      ],
    );

  }
}