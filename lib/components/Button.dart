import 'package:flutter/material.dart';
class Button extends StatelessWidget {

  static const DEFAULT = Colors.blueAccent;
  static const OPERATION = Colors.amber;
  static const EQUAL = Colors.amberAccent;

  final String text;
  final Color color;
  final void Function(String) callback;

  Button({
    @required
    this.text,
    this.color = DEFAULT,
    @required 
    this.callback,
  });


//Construtores nomeados
  Button.operation({
    @required
    this.text,
    this.color = OPERATION,
    @required this.callback,

  });

    Button.equal({
    @required
    this.text,
    this.color = EQUAL,
    @required this.callback,

  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
        child: RaisedButton(
          color: this.color,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w200,
              ),
          ), 
          onPressed: () => callback(text),      
      ),
    );
  }
}