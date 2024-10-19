import 'package:mdp_case_study/feature/products/domain/product.dart';
import 'package:mdp_case_study/product/service/base_service.dart';

class ProductService extends BaseService {
  Future<List<Product>?> fetchPaginationProducts({
    int limit = 10,
    int skip = 0,
  }) async {
    try {
      final response = await dio.get<dynamic>(
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

  Future<String> updateProductTitle(int productId, String newTitle) async {
    try {
      final response = await dio
          .put<dynamic>('/products/$productId', data: {'title': newTitle});

      if (response.statusCode == 200) {
        print('Product title updated successfully');
        return 'Product updated successfully! Status Code: ${response.statusCode}';
      } else {
        print('Product title update failed: ${response.statusCode}');
        return 'Failed to update product: ${response.statusCode}';
      }
    } catch (exception) {
      print(exception);
      return 'Failed to update product: $exception';
    }
  }
}
