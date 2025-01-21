/* -------------------------------------------------------------------------- */
/*               Configures Dio and manages HTTP requests                      */
/* -------------------------------------------------------------------------- */
import 'package:dio/dio.dart';
import 'package:flutter_cycle_2_task/core/constants/api_constants.dart';

/* -------------------------------------------------------------------------- */
/*                          DioClient class to manage HTTP requests            */
/* -------------------------------------------------------------------------- */
class DioClient {
  late Dio _dio; // Dio instance for making HTTP requests

  /* -------------------------------------------------------------------------- */
  /*                  Constructor to initialize Dio with base options           */
  /* -------------------------------------------------------------------------- */
  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl, // The base URL of the API
        connectTimeout: Duration(seconds: 5), // Connection timeout duration
        receiveTimeout: Duration(seconds: 5), // Receive timeout duration
      ),
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                    GET method to perform HTTP GET requests                 */
  /* -------------------------------------------------------------------------- */
  Future<Response> get(String endPoint) async {
    try {
      return await _dio.get(endPoint); // Perform GET request
    } on DioException catch (e) {
      throw Exception(
        _handleDioException(e), // Handle and throw exceptions
      );
    }
  }

  /* -------------------------------------------------------------------------- */
  /*           Private method to handle Dio exceptions and return messages      */
  /* -------------------------------------------------------------------------- */
  String _handleDioException(DioException exception) {
    switch (exception.type) {
      /* --------------------- Timeout error during connection -------------------- */
      case DioExceptionType.connectionTimeout:
        return "Connection Timeout";

      /* ------------------- Timeout error during data reception ------------------ */
      case DioExceptionType.receiveTimeout:
        return "Recieve Timeout";

      /* ------------------------ Invalid HTTP status code ------------------------ */
      case DioExceptionType.badResponse:
        return "Received invalid status code: ${exception.response?.statusCode}";

      /* ---------------- Unknown errors or no internet connection ---------------- */
      case DioExceptionType.unknown:
        return "No Internet Connection or Unknown Error";

      /* -------------------------- Generic error message ------------------------- */
      default:
        return "Something went wrong";
    }
  }
}
