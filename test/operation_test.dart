import 'package:binary_operations/models/operations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Binary to Decimal', () {
    Operations op = Operations();
    expect(op.binaryToDecimal('11001'), 25);
  });

  test('Decimal to Binary', () {
    Operations op = Operations();
    expect(op.decimalToBinary(25), '11001');
  });

   test('Sum', () {
    Operations op = Operations();
    expect(op.sum('11001', '11001'), '110010');
  });

  test('Sub', () {
    Operations op = Operations();
    expect(op.sub('11001', '11001'), '0');
  });

  test('Multiplication', () {
    Operations op = Operations();
    expect(op.mult('11001', '11001'), '1001110001');
  });

  test('Division', () {
    Operations op = Operations();
    expect(op.div('11001', '11001'), '1');
  });

    test('Mod', () {
    Operations op = Operations();
    expect(op.mod('11001', '11001'), '0');
  });
}
