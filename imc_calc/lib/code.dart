import 'dart:ffi';

import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC CALC',
      theme: ThemeData(
        primarySwatch: Colors.black,
      ),
      home: MyHomePage(title: 'IMC CALC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String state = "";
  Double value = null;

 //Text Field Creation
  Widget textField(String name){

    return new Container(

          child: new TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: name
            ),

          ),

    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("IMG CALC")
      ),

      body: new Container(

        child: new Center(
          child: new Column(
            children: <Widget>[

             textField("Digite sua altura"),
              textField("Digite seu peso"),
              FlatButton(
                child: Text("Calc"),
                onPressed: () => {calc()},
              )
              Text(value.toString()),



            ],
          )


        ),
      ),

    );


    }
  }
}

calc(){

}