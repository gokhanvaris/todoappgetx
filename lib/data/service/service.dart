import 'package:dio/dio.dart';
import '../../config/service_config.dart';

class Service {
  final Dio dio;

  Service({required this.dio});

  static Future<Response> apiService() async {
    try {
      Response response =
          await ServiceConstants.instance.getDio(BaseOptions(baseUrl: ServiceConstants.instance.baseUrl)).get('/todos');

      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
