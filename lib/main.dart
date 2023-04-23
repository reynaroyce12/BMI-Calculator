import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'constants.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(

      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF151026),
          appBarTheme: const AppBarTheme(
            color: kappBarColor
          ),
          // primaryColor: const Color(0xFF151026),
      ),

      home: const InputPage(),
    );
  }
}




