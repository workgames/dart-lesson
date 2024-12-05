import 'dart:io';
typedef Cell = int; // тип клетки поля
typedef GameState = int; // тип состояния игрового процесса
// фигуры в клетке поля
const Cell empty = 0;
const Cell cross = 1;
const Cell nought = 2;

// состояние игрового процесса
const GameState playing = 0;
const GameState draw = 1;
const GameState crossWin = 2;
const GameState noughtWin = 3;
const GameState quit = 3;
// Объявление глобальных переменных
late List<List<Cell>> board;
int boardSize = 3; // размер игрового поля по умолчанию
GameState state = playing;
Cell currentPlayer = cross; // текущий игрок


bool initBoard() {
  stdout.write('Enter the size of the board (3-9): ');
  int? size = int.tryParse(stdin.readLineSync()!);
  size ??= boardSize;
  if (size < 3 || size > 9) {
    return false;
  }

  boardSize = size;
  board = List.generate(size,(_) => List.filled(boardSize, empty),);
  return true;
}

void printBoard() {
  stdout.write(' ');
  for (int i = 0; i < boardSize; i++) {
    stdout.write('${i + 1} '); // вывод номера столбца
  }

  stdout.write('\n');
  for (int i = 0; i < boardSize; i++) {
    stdout.write('${i + 1} '); // вывод номера строки
    for (int j = 0; j < boardSize; j++) {
      switch (board[i][j]) {
        case empty:
        stdout.write('. ');
        case cross:
        stdout.write('X ');
        case nought:
        stdout.write('O ');
      }
    }
    print('');
  }
}

bool makeMove(int x, int y) {
  if (board[y][x] == empty) {
    board[y][x] = currentPlayer;
    return true;
  }

  return false;
}

bool checkWin(Cell player) {
  // проверка по строкам и столбцам
  for (int i = 0; i < boardSize; i++) {
    if (board[i].every((cell) => cell == player)) return true;
    if (board.every((row) => row[i] == player)) return true;
  }

  // проверка по главной диагонали
  if (List.generate(boardSize, (i) => board[i][i]).every((cell) => cell == player,)) {
    return true;
  }
  // проверка по обратной диагонали
  if (List.generate(boardSize, (i) => board[i][boardSize - i - 1]).every((cell) => cell == player)) return true;
  return false;
}

bool checkDraw() {
  return board.every((row) => row.every((cell) => cell != empty,));
}

void switchPlayer() {
  currentPlayer = currentPlayer == cross ? nought : cross;
}

void updateState() {
  if (checkWin(cross)) {
    state = crossWin;
  } else if (checkWin(nought)) {
    state = noughtWin;
  } else if (checkDraw()) {
    state = draw;
  }
}