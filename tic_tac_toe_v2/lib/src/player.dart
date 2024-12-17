import 'cell_type.dart';

class Player {
  Cell cellType;

  Player(this.cellType);

  void switchPlayer() {
    cellType = cellType == Cell.cross
        ? Cell.nought
        : cellType == Cell.nought
            ? Cell.zed
            : Cell.cross;
  }

  String get symbol => switch (cellType) {
        Cell.cross => 'X',
        Cell.nought => '0',
        Cell.zed => 'Z',
        _ => '. ',
      };
}
