import 'package:math_operations/src/token.dart';

class Lexer {
  final String input;
  int position = 0;

  Lexer(this.input);

  Token nextToken() {
    while (position < input.length) {
      final char = input[position];
      if (char == ' ') {
        position++;
        continue;
      }

      if (RegExp(r'\d').hasMatch(char)) {
        return _number();
      }

      if (char == '+') {
        position++;
        return Token('PLUS', char);
      }

      if (char == '-') {
        position++;
        return Token('MINUS', char);
      }

      if (char == '*') {
        position++;
        return Token('MULTIPLY', char);
      }

      if (char == '/') {
        position++;
        return Token('DIVIDE', char);
      }

      if (char == '(') {
        position++;
        return Token('LPAREN', char);
      }

      if (char == ')') {
        position++;
        return Token('RPAREN', char);
      }
      throw Exception('Unexpected character 1: $char');
    }

    return Token('EOF', '');
  }

  Token _number() {
    final start = position;

    while (position < input.length && RegExp(r'\d').hasMatch(input[position])) {
      position++;
    }

    return Token('NUMBER', input.substring(start, position));
  }
}
