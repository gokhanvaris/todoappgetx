import 'package:dio/dio.dart';

class ServiceConstants {
  static ServiceConstants? _instace;
  static ServiceConstants get instance {
    _instace ??= ServiceConstants._init();
    return _instace!;
  }

  ServiceConstants._init();

  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Dio getDio(BaseOptions baseOptions) {
    Dio dio = Dio(baseOptions);
    return dio;
  }
}
