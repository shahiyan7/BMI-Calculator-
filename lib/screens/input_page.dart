import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/ReusableCard.dart';
import '../components/icon_content.dart';
import '../constant.dart';
import 'reuslt_page.dart';
import '../components/bottomButton.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
// Color maleCardColor = inactiveCardColor;
// Color femaleCardColor = inactiveCardColor;

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 70;
  int age = 18;
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  Colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: "Male",
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  Colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: "Female",
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  Colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height",
                        style: klabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            "cm",
                            style: klabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xff8d8e98),
                          overlayColor: Color(0x29eb1555),
                          thumbColor: Color(0xffeb1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double heightValue) {
                            setState(() {
                              height = heightValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      Colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: klabelTextStyle,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                "KG",
                                style: klabelTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                    Colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ])
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              calculatorBrain calc =
                  calculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Resultspage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          resultInterpretation: calc.getInterpretation(),
                        )),
              );
            },
            buttonTitle: 'Calculate',
          ),
        ],
      ),
    );
  }
}
