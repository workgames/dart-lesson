import '../lib/tic_tac_toe.dart';

void main() {
  while (!initBoard()) {
    print('Invalid size, please enter again');
  }
  play();
}
