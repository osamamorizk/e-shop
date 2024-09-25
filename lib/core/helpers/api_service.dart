import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future get({required String endPoints}) async {
    dio.options = BaseOptions(
      baseUrl: 'https://fakestoreapi.com/',
    );

    Response response = await dio.get(endPoints);
    return response.data;
  }
}
