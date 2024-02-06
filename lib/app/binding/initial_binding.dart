import 'package:get/get.dart';
import 'package:getx_tutorial/app/services/config_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ConfigService(),tag: (ConfigService().toString()));
  }
}
