import 'package:basic_calculator_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';
import 'package:basic_calculator_app/ui/theme.dart';
import 'package:basic_calculator_app/constants.dart';





class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


final List<String> historico = <String>[];
String historyFile = "";



class _MyHomePageState extends State<MyHomePage> {

  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  //Button pressed function
  buttonPressed(String txtButton){



    setState(() {

      if(txtButton == "AC") {

        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;

      } else if(txtButton == "⌫"){

        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);

        if(equation == ""){
          equation = "0";
        }
      } else if(txtButton == "="){
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';

        }catch(e){

          result = "Error";

        }

        historyFile = "$equation" + "=" + "$result";
        historico.add(historyFile);
      } else {

        equationFontSize = 48.0;
        resultFontSize = 38.0;

        if(equation == "0"){
          equation = txtButton;
        }else {

          equation = equation + txtButton;
        }
      }


    });
  }

  //Conditions of PopUpMenuItens is clicked
  void optionAction(String option){
    if(option == Constants.change){
      createDialogAlert(context);

    }
    if(option == Constants.history){
      createHistoryDialogAlert(context);
    }

  }

  //History screen creation function
  createHistoryDialogAlert(BuildContext context){
    showDialog<void>(
      context: context,
       builder: (BuildContext context){
        return AlertDialog(
          title: Text("History"),
          content: Container(

            width: double.maxFinite,
            height: 400.0,

            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: historico.map((data) => Text(data)).toList(),

            )
          ),
          actions: <Widget>[

            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],

        );
       }

    );
  }

 //Function of creating theme selection screen
  createDialogAlert(BuildContext context){
    int selectedRadio = 0;
    showDialog<void>(
      context: context,
      builder: (BuildContext){


        return AlertDialog(
          title: Text("Themes",
            style: TextStyle(fontWeight: FontWeight.bold),),
          content: StatefulBuilder(
            builder: (BuildContext , StateSetter setState){
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: List<Widget>.generate(2,
                    (int index){
                  String text = "";
                   if(index == 0){
                     text = "Light";
                   } else if(index == 1 ){
                     text = "Dark";
                   }
                   return RadioListTile(
                     title: Text("$text"),
                     value: index,
                     groupValue: selectedRadio,
                     onChanged: (int value){
                       setState(() => selectedRadio = value);
                     },
                   );
                    }
                ),
              );
          },
          ),

            actions: <Widget>[
              new FlatButton(
                child: Text("Cancel"),
                onPressed: () {

                  Navigator.of(context).pop();

                },
              ),

              FlatButton(
                child: Text("Ok"),
                onPressed: (){
                  if(selectedRadio == 0){
                    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
                    _themeChanger.setTheme(ThemeData.light());
                    Navigator.of(context).pop();
                  }
                  if(selectedRadio == 1){
                    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
                    _themeChanger.setTheme(ThemeData.dark());
                    Navigator.of(context).pop();

                  }
                },
              )
            ]

        );
      },


    );



  }
  //Button Creation Function
  Widget buildButton(String txtButton){

    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(txtButton,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),

        onPressed: () => {
          buttonPressed(txtButton),
        },
      ),
    );
  }

  //Application Body
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),

          actions: <Widget>[

            PopupMenuButton<String>(
              onSelected: optionAction,
              itemBuilder: (BuildContext context){
                return Constants.options.map((String option){
                  return PopupMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );

                }).toList();
              },

            )
          ],

        ),
        body: new Container(


            child: new Column(
              children: <Widget>[

                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Text(equation, style: TextStyle(fontSize: equationFontSize),),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: Text(result, style: TextStyle(fontSize: resultFontSize),),
                ),

                new Expanded(child: new Divider()),

                new Column(

                    children: <Widget>[


                      new Row(
                        children: [
                          buildButton("1"),
                          buildButton("2"),
                          buildButton("3"),
                          buildButton("÷"),
                        ],

                      ),
                      new Row(
                        children: [
                          buildButton("4"),
                          buildButton("5"),
                          buildButton("6"),
                          buildButton("x"),
                        ],

                      ),
                      new Row(
                        children: [
                          buildButton("7"),
                          buildButton("8"),
                          buildButton("9"),
                          buildButton("-"),
                        ],

                      ),
                      new Row(
                        children: [
                          buildButton("."),
                          buildButton("0"),
                          buildButton("⌫"),
                          buildButton("+"),
                        ],

                      ),
                      new Row(
                        children: [
                          buildButton("AC"),
                          buildButton("="),

                        ],

                      ),
                    ]
                )

              ],


            )
        )
    );
  }
}
