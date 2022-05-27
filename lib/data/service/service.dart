import 'package:dio/dio.dart';
import '../../config/service_config.dart';
import '../model/data_model.dart';

class Service {
  Future<List<dynamic>> apiService() async {
    try {
      Response response =
          await ServiceConstants.instance.getDio(BaseOptions(baseUrl: ServiceConstants.instance.baseUrl)).get('/todos');

      List<dynamic> dataModel = response.data.map((item) => DataModel.fromJson(item)).toList();

      return dataModel;
    } catch (e) {
      throw e.toString();
    }
  }
}
