import 'package:math_operations/math_operations.dart';
import 'package:test/test.dart';

void main() {
  group('Parser Tests', () {
    test('Simple addition', () {
      expect(evaluate("3 + 5"), equals(8));
    });

    test('Simple subtraction', () {
      expect(evaluate("10 - 3"), equals(7));
    });

    test('Simple multiplication', () {
      expect(evaluate("4 * 2"), equals(8));
    });

    test('Simple division', () {
      expect(evaluate("8 / 2"), equals(4));
    });
    test('Combined operations', () {
      expect(evaluate("3 + 5 * 2"), equals(13));
      expect(evaluate("10 - 3 + 5"), equals(12));
      expect(evaluate("2 * 3 + 4 / 2"), equals(10));
    });

    test('Parentheses support', () {
      expect(evaluate("(1 + 2) * 3"), equals(9));
      expect(evaluate("3 * (4 + 5)"), equals(27));
      expect(evaluate("(2 + 3) * (4 - 1)"), equals(15));
    });

    test('Unary minus support', () {
      expect(evaluate("-3 + 5"), equals(2));
      expect(evaluate("5 + -3"), equals(2));
      expect(evaluate("-10 + -5"), equals(-15));
      expect(evaluate("-(1 + 2)"), equals(-3));
    });

    test('Complex expressions', () {
      expect(evaluate("3 + (2 * (5 - 3))"), equals(7));
      expect(evaluate("10 / (2 + 3) * 4"), equals(8));
    });

    test('Invalid expressions', () {
      expect(() => evaluate("3 + "), throwsA(isA<Exception>()));
      expect(() => evaluate("(1 + 2"), throwsA(isA<Exception>()));
      expect(() => evaluate("3 + * 2"), throwsA(isA<Exception>()));
    });
  });
}
