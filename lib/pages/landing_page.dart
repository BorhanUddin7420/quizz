import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.redAccent,
      child: new InkWell(
        onTap:()=> print("Hi k"),
        onDoubleTap: ()=> print("DOuble Tap"),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Welcome To" , style: new TextStyle(color: Colors.lightGreen,fontSize: 50.0,),),
            new Text("Quizz World!", style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 40.0),)
          ],
        ),
      ),
    );
  }
}