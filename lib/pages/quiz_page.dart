import 'package:flutter/material.dart';

//utls FOLDER ALL IMPORTS
import '../utls/question.dart';
import '../utls/quiz.dart';

//UI FOLDER ALL IMPORTS
import '../UI/question_text.dart';
import '../UI/answerbutton.dart';
import '../UI/correct_wrong_overley.dart';

class QuizPage extends StatefulWidget{
@override
State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage>{

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Are you human", true),
    new Question("Where are you form", false),
    new Question("What you want", false)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeDisplayed = false;

  @override
  void initState(){
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.questions;
    questionNumber = quiz.questionNumber;
  }
  
  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeDisplayed = true;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // this is our main Page
        children: <Widget>[
          new AnswerButton(true, () => handleAnswer(true)),
          new QuestionText(questionText, questionNumber),          
          new AnswerButton(false, () => handleAnswer(true)),
          
          
        ],
        ),
        overlayShouldBeDisplayed == true ? new CorrectWrongOverlay(true) : new Container()        
      ],
    );
  }
}