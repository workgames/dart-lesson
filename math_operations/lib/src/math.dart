import 'package:math_operations/src/lexer.dart';
import 'package:math_operations/src/parser.dart';

double evaluate(String input) {
  final lexer = Lexer(input);
  final parser = Parser(lexer);
  return parser.parse();
}
