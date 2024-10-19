import 'package:mdp_case_study/feature/products/domain/product.dart';
import 'package:mdp_case_study/product/service/base_service.dart';

class HomeService extends BaseService {
  Future<List<Product>?> fetchProducts({int limit = 10}) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
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
}
