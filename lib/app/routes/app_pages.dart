import 'package:get/get.dart';

import '../modules/testing/bindings/testing_binding.dart';
import '../modules/testing/views/testing_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TESTING;

  static final routes = [
    GetPage(
      name: _Paths.TESTING,
      page: () => TestingView(),
      binding: TestingBinding(),
    ),
  ];
}
