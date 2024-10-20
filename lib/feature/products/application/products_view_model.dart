import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/feature/products/data/product_service.dart';
import 'package:mdp_case_study/feature/products/domain/products_state.dart';
import 'package:mdp_case_study/product/base/base_notifier.dart';

final productsNotifierProvider =
    StateNotifierProvider<ProductsViewModel, ProductsState>((ref) {
  return ProductsViewModel();
});

class ProductsViewModel extends BaseNotifier<ProductsState> {
  ProductsViewModel() : super(const ProductsState());

  final _apiService = ProductService();

  Future<String> updateProduct(int id, String newTitle) async {
    emit(state.copyWith(isLoading: true));
    final response = await _apiService.updateProductTitle(id, newTitle);
    emit(state.copyWith(response: response, isLoading: false));
    return response;
  }

  Future<void> fetchProducts(int limit) async {
    emit(state.copyWith(isLoading: true));
    final products = await _apiService.fetchPaginationProducts(
      limit: limit,
      skip: state.skip,
    );

    if (products == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }
    if (products.length < 10) emit(state.copyWith(hasMore: false));
    emit(
      state.copyWith(
        productModel: [...state.productModel ?? [], ...products],
        skip: state.skip + limit,
      ),
    );
    emit(state.copyWith(isLoading: false));
  }
}
