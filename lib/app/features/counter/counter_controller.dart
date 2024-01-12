import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CounterController extends GetxController {
  var count = 0;
  var reactiveCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    ever(reactiveCount, (callback) => debugPrint("reactive count updated. ${reactiveCount.value}"));
  }

  void increment() {
    count++;
    update();
  }

  void reactiveIncrement() {
    reactiveCount.value++;
  }
}
