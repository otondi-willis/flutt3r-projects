import 'package:flutter/material.dart';
import 'package:globo_fitness/screens/bmi_screen.dart%20%20';
import 'package:globo_fitness/screens/intro_screen.dart';

void main() {
  runApp(GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey), 
      routes: {
        '/':(context) => IntroScreen(),
        '/bmi':(context) => BmiScreen(),
      },
      initialRoute: '/',
      //home: IntroScreen()
      );
   
    
  }
}
