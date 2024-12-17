import 'dart:io';

import 'extension.dart';

void main(List<String> arguments) {
  var url = "https:-/dart.dev";
  print(url.toList());
// [h, t, t, p, s, :, /, /, d, a, r, t, ., d, e, v]
  print(url.isUrl()); // true
  url = '-_-';
  print(url.isUrl()); // false
  const size = 3;
  late List<List<dynamic>> cells;
  cells = List.generate(size, (i) => List.filled(size, i == 1 ? '-' : '#'));
  cells[0][0] = '-';
  cells[2][2] = '-';
  cells[0][2] = '-';

  print(cells);
  print(cells[1]);
  stdout.write('\n');
  stdout.write('\n');
  for (int i = 0; i < size; i++) {
    stdout.write('${i + 1} ');

    for (int j = 0; j < size; j++) {
      switch (cells[i][j]) {
        case '-':
          stdout.write('- ');
        default:
          stdout.write('# ');
          break;
      }
    }
    print('');
  }
  stdout.write('\n');

  for (int i = 0; i < size; i++) {
    if (cells[i].every((cell) => cell == '-')) {
      print('every 1');
    }

    if (cells.every((row) => row[i] == '-')) {
      print('every 2');
    }
  }

  final t1 = List.generate(size, (i) => cells[i][i]);
  final t2 = List.generate(size, (i) => cells[i][size - i - 1]);

  var counLine = 0;
  var digRight = 0;
  var digLeft = 0;

  for (int i = 0; i < size; i++) {
    counLine = 0;
    for (int j = 0; j < size; j++) {
      if (cells[i][j] == '-') {
        counLine += 1;
      }
    }

    //элементы по диагонали
    if (cells[i][i] == '-') {
      digLeft += 1;
    }

    //элементы по побочной диагонали
    if (cells[i][cells.length - 1 - i] == '-') {
      digRight += 1;
    }

    print(
        'row ${i} - counLine ${counLine}, digRight - ${digRight}, digLeft - ${digLeft}');
    stdout.write('\n');
  }

  stdout.write('\n');
  print(t1);
  stdout.write('\n');
  print(t2);

  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];

  // Проходим по побочной диагонали
  for (int i = 0; i < matrix.length; i++) {
    // выводим элементы по диагонали
    print(matrix[i][i]);
    // выводим элементы по побочной диагонали
    //print(matrix[i][matrix.length - 1 - i]);
  }
}
