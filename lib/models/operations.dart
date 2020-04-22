import 'dart:math';

class Operations {

  //lista de operações
  static const operations = const ['%', '/', 'x', '-', '+', '='];

  final _buffer = ['0', '0'];
  int _bufferIndex = 0;
  bool _wipeValue = false;
  String _operation;
  String _value = '0';
  String _lastCommand;

//verifica o comando digitado
  void applyCommand(String command) {

    if (_isReplacingOperation(command)) {
      _operation = command;
      return;
    }
    if (command == 'AC') {
      _clearDisplay();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }
    _lastCommand = command;
  }

//verifica se o usuário está mudando de operação
  _isReplacingOperation(String command) {
    return operations.contains(_lastCommand) &&
        operations.contains(command) &&
        _lastCommand != '=' &&
        command != '=';
  }

  _setOperation(String newOperation) {
    bool isEqualSing = newOperation == '=';
    if (_bufferIndex == 0) {
      if (!isEqualSing) {
        _operation = newOperation;
        _bufferIndex = 1;
      }
    } else {
      _buffer[0] = _operations();
      _buffer[1] = '0';
      _value = _buffer[0].toString();
      _operation = isEqualSing ? null : newOperation;
      _bufferIndex = isEqualSing ? 0 : 1;
    }
    _wipeValue = true;
  }

//adicionar digitos
  _addDigit(String digit) {
    final wipeValue = _value == '0' || _wipeValue;
    final emptyValue = '';
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;

    _wipeValue = false;

    if(int.parse(_buffer[_bufferIndex]) < 0 || 
          int.parse(_buffer[_bufferIndex]) >= int.parse(decimalToBinary(255))){
            _value = '0';
    }
    _buffer[_bufferIndex] = _value ?? '0';
  }

//limpar o display
  _clearDisplay() {
    _value = '0';
    _buffer.setAll(0, ['0', '0']);

    _bufferIndex = 0;
    _operation = null;
    _wipeValue = false;
  }

//verifica a operação a ser realizada
  String _operations() {

    switch (_operation) {
      case '%':
        return mod(_buffer[0].toString(), _buffer[1].toString());
      case '/':
        return div(_buffer[0].toString(), _buffer[1].toString());
      case 'x':
        return mult(_buffer[0].toString(), _buffer[1].toString());
      case '-':
        return sub(_buffer[0].toString(), _buffer[1].toString());
      case '+':
        return sum(_buffer[0].toString(), _buffer[1].toString());
      default:
        return _buffer[0];
    }
  }

//converter binários em decimais
  int binaryToDecimal(String binary) {
    var length = binary.length;
    var multiplier = pow(2, length - 1).toDouble();
    var decimal = 0;

    for (int i = 0; i < length; i++) {
      decimal = decimal + (multiplier * int.parse(binary[i])).toInt();
      multiplier /= 2;
    }

    return decimal.toInt();
  }

  String get value {
    return _value;
  }

  //converter decimais em binários
  String decimalToBinary(int number) {
    if (number == 0) {
      return '0';
    }
    var output = '';
    while (number > 0) {
      var bit = number % 2;
      number = number ~/ 2;
      output = bit.toString() + output;
    }

    return output;
  }



//realizar soma
  String sum(String binaryValue1, String binaryValue2){
    int result = binaryToDecimal(binaryValue1) + binaryToDecimal(binaryValue2);
    return decimalToBinary(result);
  }

//realizar subtração
  String sub(String binaryValue1, String binaryValue2){
    int result = binaryToDecimal(binaryValue1) - binaryToDecimal(binaryValue2);
    return decimalToBinary(result);
  }

//realizar multiplicação
  String mult(String binaryValue1, String binaryValue2){
    int result = binaryToDecimal(binaryValue1) * binaryToDecimal(binaryValue2);
    return decimalToBinary(result);
  }

//realizar divisão
  String div(String binaryValue1, String binaryValue2){

    if(binaryValue2 == '0'){
      return 'Não existe divisão por 0';
    }
    int result = binaryToDecimal(binaryValue1) ~/ binaryToDecimal(binaryValue2);
    return decimalToBinary(result);
  }

//resto da divisão
  String mod(String binaryValue1, String binaryValue2){
    int result = binaryToDecimal(binaryValue1) % binaryToDecimal(binaryValue2);
    return decimalToBinary(result);
  }
}
