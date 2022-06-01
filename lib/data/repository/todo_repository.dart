import 'package:dio/dio.dart';
import 'package:todoapp_getx/data/model/data_model.dart';

import '../service/service.dart';

class TodoRepository {
  final Service service;

  TodoRepository({required this.service});

  static Future<List<dynamic>> getDataFromDataModel() async {
    Response response = await Service.apiService();
    List<dynamic> dataList = response.data.map((item) => DataModel.fromJson(item)).toList();
    return dataList;
  }
}
