import 'package:flutter/material.dart';
import 'Button.dart';
import 'Button_row.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) callback;

  Keyboard(this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: <Widget>[
          ButtonRow([
            Button(text: 'AC', callback: callback),
            Button.operation(text: '%', callback: callback),
          ]),
          SizedBox(
            height: 1,
          ),
          ButtonRow([
            Button(text: '0', callback: callback),
            Button.operation(text: 'x', callback: callback),
          ]),
          SizedBox(
            height: 1,
          ),
          ButtonRow([
            Button(text: '1', callback: callback),
            Button.operation(text: '-', callback: callback),
          ]),
          SizedBox(
            height: 1,
          ),
          ButtonRow([
            Button.operation(text: '+', callback: callback),
            Button.operation(text: '/', callback: callback),
          ]),
          SizedBox(
            height: 1,
          ),
          ButtonRow([
            Button.equal(text: '=', callback: callback),
          ])
        ],
      ),
    );
  }
}
