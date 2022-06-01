import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../ui/home/controller/network_controller.dart';
import '../../service/service.dart';

class NetworkControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Service>(Service(dio: Dio()));
    Get.lazyPut<NetworkController>(() => NetworkController());
  }
}
