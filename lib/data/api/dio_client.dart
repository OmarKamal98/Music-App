import 'package:dio/dio.dart';
import 'package:musicapp/data/api/api_constants.dart';

class DioClient {
  DioClient._() {
    initDio();
  }

  static final DioClient dioClient = DioClient._();
  Dio dio;
  initDio() {
    dio = Dio();
    dio.options.baseUrl = ApiConstant.baseUrl;
    dio.options.headers = {
      'X-RapidAPI-Host': 'spotify23.p.rapidapi.com',
      'X-RapidAPI-Key': 'a7f6e53b75mshcb8d87b2a5013d0p188139jsn01f67df88f9a'
    };
  }
}
