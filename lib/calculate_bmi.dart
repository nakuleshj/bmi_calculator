import 'dart:math';
class CalculateBMI{
  CalculateBMI({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculateBMI()
  {
    _bmi=(weight/pow(height/100,2));
     return _bmi.toStringAsFixed(2);
  }
  String getResult(){
    if(_bmi>=25){
      return 'Overweight';
    }
    else if(_bmi<18.5){
      return 'Underweight';
    }
    else{
      return 'Normal';
    }
  }
  String getInterpretation(){
    if(_bmi>=25){
      return 'You have to decrease your caloric intake ';
    }
    else if(_bmi<18.5){
      return 'You have to increase your caloric intake ';
    }
    else{
      return 'Good job! Keep it up!';
    }
  }
}