import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cards.dart';
import 'icon_buttons.dart';
import 'package:bmicalculator/genderContent.dart';
import 'constants.dart';
import 'package:bmicalculator/resultPage.dart';
import 'calculate_bmi.dart';
enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height=155;
  int weight=60;
  int age=18;
  CalculateBMI calcObj=CalculateBMI();
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI Calculator',
              style: Theme.of(context).textTheme.headline1),
        ),
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.Male;
                          print(selectedGender);
                        });
                      },
                      child: ReusableCard(
                          clr: selectedGender == Gender.Male
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          child: CardContent(
                              txt: "MALE", icon: FontAwesomeIcons.mars),),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.Female;
                        });
                      },
                      child: ReusableCard(
                        clr: selectedGender == Gender.Female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        child: CardContent(
                            txt: "FEMALE", icon: FontAwesomeIcons.venus),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  clr: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT', style: kLabelTextStyle),
                      SizedBox(
                        height: 25,
                      ),
                      Text(height.toString() + ' cms',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          )),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Colors.red,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10.0),
                          overlayColor: Color(0x15ff0000),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 140,
                          max: 200,
                          onChanged: (h) {
                            setState(() {
                              height = h.round();
                            }
                            );
                          },
                          inactiveColor: Colors.grey,
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      clr: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("WEIGHT", style: kLabelTextStyle),
                          Text(weight.toString(),
                              style: TextStyle(fontSize: 50, color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: IconButtons(
                                  ico: kMinusIcon,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: IconButtons(
                                  ico: kPlusIcon,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      clr: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("AGE", style: kLabelTextStyle),
                          Text(age.toString(),
                              style: TextStyle(fontSize: 50, color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: IconButtons(
                                  ico: kMinusIcon,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: IconButtons(
                                  ico: kPlusIcon,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                CalculateBMI calcObj=CalculateBMI(height: height,weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(bmi:calcObj.calculateBMI(),result:calcObj.getResult(),interpretation:calcObj.getInterpretation()),),
                );
              },
              child: Container(
                height: kBottomContainerHeight,
                width: double.infinity,
                color: kBottomContainerColor,
                alignment: Alignment.center,
                child: Text('CALCULATE',
                    style: Theme.of(context).textTheme.headline1),
              ),
            ),
          ],
        ));
  }
}
