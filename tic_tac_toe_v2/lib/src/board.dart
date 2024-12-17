import 'dart:io';

import 'cell_type.dart';

class Board {
  late List<List<Cell>> cells;
  final int size;

  Board(this.size) {
    cells = List.generate(size, (_) => List.filled(size, Cell.empty));
  }

  void printBoard() {
    stdout.write('  ');
    for (int i = 0; i < size; i++) {
      stdout.write('${i + 1} ');
    }
    stdout.write('\n');

    for (int i = 0; i < size; i++) {
      stdout.write('${i + 1} ');

      for (int j = 0; j < size; j++) {
        switch (cells[i][j]) {
          case Cell.empty:
            stdout.write('. ');
          case Cell.cross:
            stdout.write('X ');
          case Cell.nought:
            stdout.write('O ');
          case Cell.zed:
            stdout.write('Z ');
        }
      }
      print('');
    }
  }

  bool _makeMove(int x, int y) {
    return cells[y][x] == Cell.empty;
  }

  bool setSymbol(int x, int y, Cell cellType) {
    if (_makeMove(x, y)) {
      cells[y][x] = cellType;
      return true;
    }
    return false;
  }

  bool checkWin(Cell player) {
    var counLine = 0;
    var digRight = 0;
    var digLeft = 0;
    final countWin = size - 1;

    for (int i = 0; i < size; i++) {
      counLine = 0;
      for (int j = 0; j < size; j++) {
        if (cells[i][j] == player) {
          counLine += 1;
        }
      }

      //элементы по диагонали
      if (cells[i][i] == player) {
        digLeft += 1;
      }

      //элементы по побочной диагонали
      if (cells[i][cells.length - 1 - i] == player) {
        digRight += 1;
      }

      if (countWin == counLine || digRight == countWin || digLeft == countWin) {
        return true;
      }
    }

    return false;
  }

  bool checkDraw() {
    return cells.every((row) => row.every((cell) => cell != Cell.empty));
  }
}
