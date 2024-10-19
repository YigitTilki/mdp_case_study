import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/product/service/api_service.dart';
import 'package:mdp_case_study/product/state/base/base_notifier.dart';
import 'package:mdp_case_study/product/state/products/products_state.dart';

final productsNotifierProvider =
    StateNotifierProvider<ProductsViewModel, ProductsState>((ref) {
  return ProductsViewModel();
});

class ProductsViewModel extends BaseNotifier<ProductsState> {
  ProductsViewModel() : super(const ProductsState());

  final _apiService = ApiService();

  Future<void> fetchProducts(int limit) async {
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
  }
}
