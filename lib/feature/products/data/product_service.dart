import 'package:easy_localization/easy_localization.dart';
import 'package:mdp_case_study/feature/products/domain/product.dart';
import 'package:mdp_case_study/product/base/base_service.dart';
import 'package:mdp_case_study/product/init/languages/locale_keys.g.dart';

class ProductService extends BaseService {
  Future<List<Product>?> fetchPaginationProducts({
    int limit = 10,
    int skip = 0,
  }) async {
    final queryParams = {
      'limit': limit,
      'skip': skip,
      'select': 'title,price,description,images',
    };

    return handleApiCall<List<Product>>(
      request: () =>
          dio.get<dynamic>('/products', queryParameters: queryParams),
      onSuccess: (response) {
        final productsJson = response.data['products'] as List<dynamic>;
        return productsJson
            .map((json) => Product.fromJson(json as Map<String, dynamic>))
            .toList();
      },
      onError: () {
        logger.d('Failed to fetch products.');
        return [];
      },
    );
  }

  Future<String?> updateProductTitle(
    int productId,
    String newTitle,
  ) async {
    final data = {'title': newTitle};

    return handleApiCall<String>(
      request: () => dio.put<dynamic>('/products/$productId', data: data),
      onSuccess: (response) {
        logger.d('Product title updated successfully');
        return '${LocaleKeys.validation_product_updated_successfully.tr()}: ${response.statusCode}';
      },
      onError: () => LocaleKeys.validation_failed_update_product.tr(),
    );
  }
}
