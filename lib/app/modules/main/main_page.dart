import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_tutorial/app/modules/counter/counter_page.dart';
import 'package:getx_tutorial/flavors.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/main_page';
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(F.title)),
      body: Column(
        children: [
          ListTile(
            title: const Text('Counter'),
            subtitle: const Text('-'),
            onTap: () {
              Get.toNamed(CounterPage.routeName);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
