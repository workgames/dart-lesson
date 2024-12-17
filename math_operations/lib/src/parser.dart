import 'package:math_operations/src/lexer.dart';
import 'package:math_operations/src/token.dart';

class Parser {
  final Lexer lexer;
  late Token currentToken;

  Parser(this.lexer) {
    currentToken = lexer.nextToken();
  }

  void eat(String tokenType) {
    if (currentToken.type == tokenType) {
      currentToken = lexer.nextToken();
    } else {
      throw Exception('Unexpected token: ${currentToken.value}');
    }
  }

  double parse() {
    return expression();
  }

  double expression() {
    double result = term();

    while (currentToken.type == 'PLUS' || currentToken.type == 'MINUS') {
      if (currentToken.type == 'PLUS') {
        eat('PLUS');
        result += term();
      } else if (currentToken.type == 'MINUS') {
        eat('MINUS');
        result -= term();
      }
    }

    return result;
  }

  double term() {
    double result = factor();

    while (currentToken.type == 'MULTIPLY' || currentToken.type == 'DIVIDE') {
      if (currentToken.type == 'MULTIPLY') {
        eat('MULTIPLY');
        result *= factor();
      } else if (currentToken.type == 'DIVIDE') {
        eat('DIVIDE');
        result /= factor();
      }
    }

    return result;
  }

  double factor() {
    if (currentToken.type == 'NUMBER') {
      double value = double.parse(currentToken.value);
      eat('NUMBER');
      return value;
    } else if (currentToken.type == 'MINUS') {
      // Унарный минус
      eat('MINUS');
      return -factor();
    } else if (currentToken.type == 'LPAREN') {
      eat('LPAREN');
      double result = expression();
      eat('RPAREN');
      return result;
    }

    throw Exception('Unexpected token: ${currentToken.value}');
  }
}
