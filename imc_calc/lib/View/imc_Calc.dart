import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculadoraimc extends StatefulWidget {
  @override
  _CalculadoraimcState createState() => _CalculadoraimcState();
}

class _CalculadoraimcState extends State<Calculadoraimc> {
   final TextEditingController alturaControl = new TextEditingController();
  final TextEditingController pesoControl = new TextEditingController();
  String peso = "";
  String estado = "";
   void calcular(){
   setState(() {
    double peso2 = double.parse(pesoControl.text);
    double altura = double.parse(alturaControl.text);
    double resultado = peso2 / (altura * altura);
     peso = resultado.toString();

if(alturaControl.text.isNotEmpty && pesoControl.text.isNotEmpty){


  if(resultado < 16) {

   estado = "Magreza";

  } else if(resultado > 16 && resultado <= 17 ){

    estado = "Magreza Moderada";

  } else if(resultado > 17 && resultado <= 18.5){

    estado = "Magreza Leve";

  } else if(resultado > 18.5 && resultado <= 25){

    estado = "Saudável";

  } else if(resultado > 25 && resultado <= 30){

    estado = "Sobrepeso";

  } else if(resultado > 30 && resultado <= 35){

    estado = "Obesidade I";

  } else if(resultado > 35 && resultado <= 40) {

    estado = "Obesidade II";

  } else if(resultado > 40) {

    estado = "Obesidade III";
  }

} 

     
   });

 

}
  @override
 
  

 

  Widget build(BuildContext context) {
    return Scaffold(
      
resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
      ),

      body: new Container(
        

        child: new Column(

          children: <Widget>[

            SizedBox(height: 10,),
            
            Container(
      
      alignment: Alignment.center,
     
      child: Image.asset("imagens/logo.png", width: 500, height: 100,)

  ),

            SizedBox(height: 5.0,),

            TextField(
  
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      icon: Icon(Icons.date_range),
      labelText: "Idade",
    ),

  ),
            
            SizedBox(height: 10.0,),

            TextField(

    keyboardType: TextInputType.number,
    controller: alturaControl,
    decoration: InputDecoration(
      icon: Icon(Icons.graphic_eq),
      labelText: "Altura(m)",
    ),
  ),

            SizedBox(height: 10.0,),

            TextFormField(

    keyboardType: TextInputType.number,
    controller: pesoControl,
    decoration: InputDecoration(
      icon: Icon(Icons.info),
      labelText: "Peso(kg)",
    ),


  ),

            SizedBox(height: 10.0,),

            RaisedButton(

    child: Text("Calcular"),
    onPressed: calcular,
    color: Colors.orange,
  ),

            SizedBox(height: 20.0,),

            Container(
    padding: EdgeInsets.all(7.0),
    child: Text("$peso", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)
    )
  ),

            SizedBox(height: 1.0,),

            Container(
    padding: EdgeInsets.all(15.0),
    child: Text("$estado", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)
    )
  )

            








          ],
        ),


      )



        );


  }
      

  }
