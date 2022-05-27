import 'package:get/get.dart';
import 'package:todoapp_getx/data/service/controller/network_controller.dart';

import '../../service/service.dart';

class NetworkControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Service>(Service());
    Get.lazyPut<NetworkController>(() => NetworkController());
  }
}
