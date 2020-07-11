import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmi,
      @required this.result,
      @required this.interpretation});
  final String bmi;
  final String result;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator',
              style: Theme.of(context).textTheme.headline1),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex:1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Text(
                  'Your result:',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 40,
                      ),
                ),
              ),
            ),
            Expanded(
              flex:4,
                child: Column(
                  children: <Widget>[
                    Expanded(flex:1,child: Text(result,style: TextStyle(color: Colors.green, fontSize: 20),textAlign: TextAlign.center,)),
                    Expanded(
                        flex:2,
                      child: Container(
                          child: Text(bmi,
                            style: TextStyle(color: Colors.white, fontSize: 100),
                          )),
                    ),
                    Expanded(
                      flex:1,
                        child: Container(
                            child: Text(
                              interpretation,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),),),
                  ],
                )),

            RecalculateButton()
          ],
        ),
      ),
    );
  }
}

class RecalculateButton extends StatelessWidget {
//  CalculateButton(int height,int weight,Gender gender,int age){
//
//  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: kBottomContainerHeight,
        width: double.infinity,
        color: kBottomContainerColor,
        alignment: Alignment.center,
        child:
            Text('RECALCULATE', style: Theme.of(context).textTheme.headline1),
      ),
    );
  }
}
