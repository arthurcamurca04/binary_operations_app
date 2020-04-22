import 'package:flutter/material.dart';
import 'Button.dart';

class ButtonRow extends StatelessWidget {

  final List<Button> botoes;

  ButtonRow(this.botoes);

  @override
  Widget build(BuildContext context) {
    
    //linha de botoes
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: botoes.fold(<Widget>[], (list, btn){
          list.isEmpty ? list.add(btn) : list.addAll([SizedBox(width: 1,), btn]);
          return list;
        }),
      ),
    );
  }
}