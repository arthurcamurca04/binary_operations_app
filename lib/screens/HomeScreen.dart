import 'package:binary_operations/components/display.dart';
import 'package:binary_operations/models/operations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/Keyboard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final Operations operations = Operations();

  _onPressed(String command){
    setState(() {
      try{
        operations.applyCommand(command);
      }catch(e){
        print(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Binary Operations',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
            body: Column(
          children: <Widget>[
          Display(operations.value),
          Keyboard(_onPressed)
        ],),
      ),
    );
  }
}