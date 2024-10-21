import 'package:mdp_case_study/feature/products/domain/product.dart';
import 'package:mdp_case_study/product/base/base_service.dart';

class HomeService extends BaseService {
  Future<List<Product>?> fetchProducts({int limit = 10}) async {
    return handleApiCall<List<Product>>(
      request: () => dio.get<Map<String, dynamic>>(
        '/products',
        queryParameters: {'limit': limit},
      ),
      onSuccess: (response) {
        final productsJson = response.data!['products'] as List<dynamic>;
        return productsJson
            .map((json) => Product.fromJson(json as Map<String, dynamic>))
            .toList();
      },
      onError: () {
        logger.d('Fetch products failed.');
        return null;
      },
    );
  }
}
