
import 'questions.dart';


class QuizerBrain{

  int _p = 0; 
  List<Questions> _ques = [

    Questions('You can lead a cow down stairs but not up stairs.', false),
    Questions('Approximately one quarter of human bones are in the feet.', true),
    Questions('A slug\'s blood is green.', true)

  ];

String getQuestions()=> (_ques[_p].qs);
bool getAns()=> (_ques[_p].ans);
void changeState(){
  if (_p< _ques.length-1) {
    _p++;    
  }
  
}



}