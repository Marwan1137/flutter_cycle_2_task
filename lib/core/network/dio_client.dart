/* -------------------------------------------------------------------------- */
/*                  Configures Dio and manages HTTP requests                  */
/* -------------------------------------------------------------------------- */
import 'package:dio/dio.dart';
import 'package:flutter_cycle_2_task/core/constants/api_constants.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5),
      ),
    );
  }

  Future<Response> get(String endPoint) async {
    try {
      return await _dio.get(endPoint);
    } on DioException catch (e) {
      throw Exception(
        _handleDioException(e),
      );
    }
  }

  String _handleDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection Timeout";
      case DioExceptionType.receiveTimeout:
        return "Recieve Timeout";
      case DioExceptionType.badResponse:
        return "Received invalid status code: ${exception.response?.statusCode}";
      case DioExceptionType.unknown:
        return "No Internet Connection or Unknown Error";
      default:
        return "Something went wrong";
    }
  }
}
