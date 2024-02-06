import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_tutorial/app/modules/counter/counter_controller.dart';

class CounterPage extends StatelessWidget {
  static const routeName = '/counter_page';

  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var counterController = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(title: const Text("Counter Page")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /* GetBuilder */
            GetBuilder<CounterController>(
              builder: (_) => Text(
                "${counterController.count} click with GetBuilder.",
              ),
            ),

            /* GetX */
            GetX<CounterController>(
              init: counterController, // INIT IT ONLY THE FIRST TIME
              builder: (_) => Text(
                "${counterController.reactiveCount} click with GetX.",
              ),
            ),

            /* Obx */
            Obx(
              () => Text(
                "${counterController.reactiveCount} click with Obx.",
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
          counterController.reactiveIncrement();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
