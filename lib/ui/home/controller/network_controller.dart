import 'package:get/get.dart';

import '../../../data/repository/todo_repository.dart';

class NetworkController extends GetxController {
  var todoItems = <dynamic>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getResponse();
    super.onInit();
  }

  void getResponse() async {
    try {
      final List<dynamic> _todoItems = await TodoRepository.getDataFromDataModel();
      todoItems.value = _todoItems;
    } catch (e) {
      print(e.toString());
    }
  }

  void show() => isLoading.toggle();
  void hide() => isLoading.toggle();
}
