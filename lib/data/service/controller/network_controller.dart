import 'package:get/get.dart';

import 'package:todoapp_getx/data/service/service.dart';

class NetworkController extends GetxController {
  NetworkController() {
    apiService = Get.find<Service>();
    getResponse();
  }
  Service? apiService;
  var dataModel;
  RxBool isLoading = false.obs;
  void getResponse() async {
    show();
    dataModel = await apiService!.apiService();
    hide();
  }

  void show() => isLoading.toggle();
  void hide() => isLoading.toggle();
}
