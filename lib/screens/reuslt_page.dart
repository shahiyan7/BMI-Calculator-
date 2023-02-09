import 'package:flutter/material.dart';
import 'input_page.dart';
import '../components/ReusableCard.dart';
import '../constant.dart';
import '../components/bottomButton.dart';

class Resultspage extends StatelessWidget {
  Resultspage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.resultInterpretation});
  final bmiResult;
  final resultText;
  final resultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Text(
                  "Your Result",
                  style: kTitleTextStyle,
                ),
                padding: EdgeInsets.only(left: 20.0, top: 10.0),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                Colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBmiTextStyle,
                    ),
                    Text(
                      resultInterpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'Re-Calculate',
            )
          ],
        ));
  }
}
