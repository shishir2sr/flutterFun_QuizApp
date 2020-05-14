import 'questions.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

class QuizerBrain {
  int _p = 0;
  List<Questions> _ques = [
    Questions('A male Rhinoceros is known as bull', true),
    Questions('Abraham Lincoln had no middle name',true),
    Questions('Japan has square watermelons.', true),
    Questions('Before becoming queen, Queen Elizabeth was a mechanic.', true),
    Questions('Cows sleep standing up. ', true),
    Questions('Polar bears’ skin is black', true),
    Questions('. There’s a city in Pennsylvania called Intercourse.', true),
    Questions('When you mix red and blue paint together, purple color will be produced', true),
    Questions('Canberra is the capital of Australia', true),
    Questions('The answers of all above questions are true', true),
    
  ];

  String getQuestions() => (_ques[_p].qs);
  bool getAns() => (_ques[_p].ans);
  void changeState() {
    if (_p < _ques.length - 1) {
      _p++;
    }
  }

  int qsLen() => (_ques.length);

  void resetState() {
    _p = 0;
  }
}
