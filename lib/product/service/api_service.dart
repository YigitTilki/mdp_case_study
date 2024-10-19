import 'package:dio/dio.dart';
import 'package:mdp_case_study/product/model/login_request_model.dart';
import 'package:mdp_case_study/product/model/product.dart';
import 'package:mdp_case_study/product/model/user.dart';
import 'package:mdp_case_study/product/service/base/service.dart';

class ApiService extends Service {
  ApiService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Requesting: ${options.method} ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('Response: ${response.statusCode} ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print('Error occurred: ${e.message}');
          return handler.next(e);
        },
      ),
    );
  }
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  @override
  Future<User?> login(LoginRequestModel loginRequest) async {
    try {
      final data = loginRequest.toJson();

      final response = await _dio.post<dynamic>('/auth/login', data: data);

      if (response.statusCode == 200) {
        return User.fromJson(response.data! as Map<String, dynamic>);
      } else {
        print('Login failed: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Login request error: $e');
      return null;
    }
  }

  Future<List<Product>?> fetchProducts({int limit = 10}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/products',
        queryParameters: {'limit': limit},
      );

      if (response.statusCode == 200) {
        final productsJson = response.data!['products'] as List<dynamic>;

        return productsJson
            .map((json) => Product.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        print('Fetch products failed: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Fetch products request error: $e');
      return null;
    }
  }

  Future<List<Product>?> fetchPaginationProducts({
    int limit = 10,
    int skip = 0,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        '/products',
        queryParameters: {
          'limit': limit,
          'skip': skip,
          'select': 'title,price,description,images',
        },
      );

      print('API Response: ${response.data}');

      if (response.statusCode == 200) {
        final productsJson = response.data['products'] as List<dynamic>;

        return productsJson
            .map((json) => Product.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        print('Fetch products failed: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Fetch products request error: $e');
      return null;
    }
  }
}
