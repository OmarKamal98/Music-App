import 'package:dio/dio.dart';
import 'package:musicapp/data/api/api_constants.dart';

class DioClient {
  DioClient._();
  static final DioClient dioClient = DioClient._();
  Dio dio;
  initDio() {
    dio = Dio();
    dio.options.baseUrl = ApiConstant.baseUrl;
    // dio.options.headers={
    //   ''
    // }
  }

  getAllAlbum() {
    // dio.get(path)
  }
}
