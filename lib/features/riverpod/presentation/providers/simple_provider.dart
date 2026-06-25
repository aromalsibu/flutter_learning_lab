import 'package:flutter_riverpod/flutter_riverpod.dart';

final myNameProvider = Provider<String>((ref) => 'Elen');
final execProvider = Provider<Executor>((ref) {
  return Executor();
});

class Executor {
  bool isStarted = false;
  void start() {
    isStarted = true;
    print('Started');
  }

  void end() {
    isStarted = false;
    print('end');
  }

  bool getState() {
    return isStarted;
  }
}
