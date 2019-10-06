import 'package:basic_calculator_app/ui/theme.dart';
import 'package:flutter/material.dart';
import 'ui/app.dart';
import 'ui/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => ThemeChanger(ThemeData.dark()),

      child: MaterialAppWithTheme(),


    );
  }
}


class MaterialAppWithTheme extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Calculator',
      home: MyHomePage(title: 'Calculator'),
      theme: theme.getTheme(),
        debugShowCheckedModeBanner: false

    );
  }

}

