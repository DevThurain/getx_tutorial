import 'package:get/state_manager.dart';

class CounterController extends GetxController {
  var count = 0;
  var reactiveCount = 0.obs;

  void increment() {
    count++;
    update();
  }

  void reactiveIncrement() {
    reactiveCount++;
  }
}
