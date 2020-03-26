import 'package:calculadora_imc/View/imc_Calc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
       
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: Calculadoraimc(),
    );
  }
}


