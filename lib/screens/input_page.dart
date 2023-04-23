import 'package:flutter/material.dart';
import '../components/card_icon.dart';
import '../components/card.dart';
import '../constants.dart';
import '../screens/results_page.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calc/calculations.dart';


class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String selectedGender = '';
  int height = 120;

  int weight = 20;
  int defaultWeight = 20;
  int minWeight = 14;

  int age = 10;
  int defaultAge = 10;
  int minAge = 4;

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = ThemeData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
                children:   [
                  Expanded(child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Male';
                      });
                    },
                      child: EachCard(
                        customColor: selectedGender == 'Male' ? kcolor : kinactiveCardColor,
                        cardChild: const CardIcon(customIcon: Icons.male, customText: 'MALE',),)
                  ),),
                  Expanded(child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Female';
                      });
                    },
                      child: EachCard(
                          customColor: selectedGender == 'Female' ? kcolor : kinactiveCardColor,
                          cardChild: const CardIcon(customIcon: Icons.female, customText: 'FEMALE',))),),
            ])),

           Expanded(child: EachCard(customColor: kcolor, cardChild: Column(
             mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('HEIGHT', style: kcustomTextStyles,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(height.toString(), style: knumberTextStyles,),
                        const Text(' cm', style: knumberTextStyles,),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0)
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 300.0,
                        activeColor: ksliderActiveColor,
                        inactiveColor: ksliderInactiveColor,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    )
                ],
            ),)),

          Expanded(child: Row(
            children:   [
              Expanded(child: EachCard(customColor: kcolor,  cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                      const Text('WEIGHT', style: kcustomTextStyles,),
                      Text(weight >= minWeight ? weight.toString() : defaultWeight.toString(), style: knumberTextStyles),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              weight--;
                              if (weight <= minWeight) {
                                weight = defaultWeight;
                              }
                            });
                          },
                          backgroundColor: kfloatingIconColor,
                          heroTag: 'Weight buttons',
                          child: const Icon(Icons.remove, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        FloatingActionButton(
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                          backgroundColor: kfloatingIconColor,
                          child: const Icon(Icons.add, color: Colors.white),
                        )
                      ],
                    ),

              ],
              )),),
              Expanded(child: EachCard(customColor: kcolor,  cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                      const Text('AGE', style: kcustomTextStyles),
                      Text(age >= minAge && age <= 100 ? age.toString() : defaultAge.toString(), style: knumberTextStyles,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                age--;
                                if (age <= minAge ) {
                                  age = defaultAge;
                                }
                              });
                            },
                            backgroundColor: kfloatingIconColor,
                            heroTag: 'Age buttons',
                            child: const Icon(Icons.remove, color: Colors.white),

                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                          FloatingActionButton(
                          heroTag: null,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            backgroundColor: kfloatingIconColor,
                            child: const Icon(Icons.add, color: Colors.white),
                          )
                        ],
                      )

              ],
              )),),
            ],
          )),
           BottomButton(onTap: () {
             Calculator bmiCal = Calculator(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ResultsPage(
                 bmiResult: bmiCal.calculateBmi(),
                 resultText: bmiCal.getResults(),
                 resultDesc: bmiCal.getDescription(),
              );
            }));
          }, buttonText: 'CALCULATE',)
        ],
      )
    );
  }
}





