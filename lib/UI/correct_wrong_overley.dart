import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget{

  final bool _isCorrect;

  CorrectWrongOverlay(this._isCorrect);

  @override
  State createState() => new CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin{
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationControler;

  @override
  void initState(){
    super.initState();
    _iconAnimationControler = new AnimationController(duration: new Duration(seconds: 2), vsync: this);
    _iconAnimation = new CurvedAnimation(parent:_iconAnimationControler, curve: Curves.elasticInOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationControler.forward();
  }
  
  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => print("Overlay Tapped"),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: new Transform.rotate(
                  angle: _iconAnimation.value * 2 * PI,
                  child: new Icon(widget._isCorrect == true ? Icons.done : Icons.clear, size: _iconAnimation.value * 80.0,color: Colors.green,),
              )
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),
            new Text(widget._isCorrect == true ? "You 're Right" : "Wrong", 
                style: new TextStyle(
                    color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  )
          ],
        ),
      ),
    );
  }
}