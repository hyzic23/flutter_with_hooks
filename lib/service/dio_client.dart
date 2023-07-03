import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();
  final _baseUrl = 'http://localhost:5096/api/';
}
