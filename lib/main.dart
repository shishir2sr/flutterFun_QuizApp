import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizer_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizerBrain qb = QuizerBrain();
  List<Icon> ansIcon = [];
  int scr =0;

  void chkAns(bool usersAns) {
    if (ansIcon.length >= qb.qsLen()) {
      print('fulll');
      Alert(context: context, title: 'Game Over!',
      desc: 'Your Score: $scr.\n Try again. Thak you :)',
       buttons: [
        DialogButton(
          color: Colors.teal[500],
            child: Text('Start again!',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            ),
            onPressed: () {
              setState(() {
                qb.resetState();
                ansIcon = [];
                scr=0;
              });
              Navigator.pop(context);
            })
      ]).show();
    } else {
      if (usersAns == qb.getAns()) {
        ansIcon.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        scr++;
      } else {
        ansIcon.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
    }
    print('all okay');
    setState(() {
      qb.changeState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                qb.getQuestions(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                chkAns(true);

                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                chkAns(false);

                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: ansIcon,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
