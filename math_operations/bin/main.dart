import 'package:math_operations/math_operations.dart' as operations;

void main(List<String> arguments) {
  var result1 = operations.evaluate('10*5+4/2-1');
  print('Пример - 10*5+4/2-1 = ${result1}');

  var result2 = operations.evaluate('(10*3-5)/5');
  print('Пример - (10*3-5)/5 = ${result2}');

  var result3 = operations.evaluate('3*10+15/(3+2)');
  print('Пример - 3*10+15/(3+2) = ${result3}');

  //Unary minus пример

  var result4 = operations.evaluate('-10 + -5');
  print('Пример - -10 + -5 = ${result4}');

  var result5 = operations.evaluate('-(1 + 2)');
  print('Пример - -(1 + 2) = ${result5}');
}
