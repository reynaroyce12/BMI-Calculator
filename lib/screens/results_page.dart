import 'package:flutter/material.dart';
import '../components/card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../screens/input_page.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String resultDesc;
  const ResultsPage({super.key, required this.bmiResult, required this.resultText, required this.resultDesc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('Your Results', style: kresultStyle),
            ),
          ),
          Expanded(
            flex: 7,
            child: EachCard(customColor: kcolor, cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                  Text(resultText, style: kresultTextStyle),
                  Text(bmiResult, style: const TextStyle(fontSize: 100.0)),
                  Text(resultDesc, textAlign: TextAlign.center, style: const TextStyle(fontSize: 22.0),)
              ],
            ),),
          ),
          BottomButton(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const InputPage();
            }));
          }, buttonText: 'RE-CALCULATE',)
        ],
      )
    );
  }
}
