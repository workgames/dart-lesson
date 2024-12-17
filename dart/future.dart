import 'dart:async';
import 'dart:io';

int add() => 10 + 15;
void main(List<String> arguments) {
  var firstFuture = Future<int>(add);
  Future(() => print('Oo'));
  firstFuture.then((value) => print(value));
  print('завершение main');

  // var count = 0;
  // Timer.periodic(
  //   Duration(milliseconds: 500),
  //   (timer) {
  //     stdout.write(count);
  //     count++;
  //     if (count >= 10) {
  //       stdout.write('\n');
  //       timer.cancel();
  //     }
  //   },
  // );

  var future2 = Future.delayed(
    Duration(seconds: 4),
    () => 'Future 2',
  );

  future2
      .timeout(
        Duration(seconds: 2),
        onTimeout: () => 'Timeout for Future 2',
      )
      .then((value) => print(value));
}
