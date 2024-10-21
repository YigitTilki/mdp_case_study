import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class BaseService {
  BaseService()
      : dio = Dio(
          BaseOptions(
            baseUrl: _baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: _headers,
          ),
        ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          logger.d('Requesting: ${options.method} ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          logger.d('Response: ${response.statusCode} ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          logger.d('Error occurred: ${e.message}');
          return handler.next(e);
        },
      ),
    );
  }
  static const String _baseUrl = 'https://dummyjson.com';
  static const Map<String, dynamic> _headers = {
    'Content-Type': 'application/json',
  };
  final Dio dio;
  final Logger logger = Logger();

  Future<T?> handleApiCall<T>({
    required Future<dynamic> Function() request,
    required T Function(dynamic response) onSuccess,
    required T? Function() onError,
  }) async {
    try {
      final response = await request() as Response<dynamic>;

      if (response.statusCode == 200) {
        return onSuccess(response);
      } else {
        logger.d('API Error: ${response.statusCode}');
        return onError();
      }
    } catch (e) {
      logger.d('API Request Error: $e');
      return onError();
    }
  }
}
