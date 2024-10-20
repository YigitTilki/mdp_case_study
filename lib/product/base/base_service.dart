import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class BaseService {
  BaseService()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'https://dummyjson.com',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {
              'Content-Type': 'application/json',
            },
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
  final Dio dio;
  final Logger logger = Logger();
}
