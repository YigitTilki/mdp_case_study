import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/product/service/api_service.dart';
import 'package:mdp_case_study/product/state/base/base_notifier.dart';
import 'package:mdp_case_study/product/state/home/home_state.dart';

final homeNotifierProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  return HomeViewModel();
});

class HomeViewModel extends BaseNotifier<HomeState> {
  HomeViewModel() : super(const HomeState());

  final _apiService = ApiService();

  Future<void> get10Product() async {
    emit(state.copyWith(isLoading: true));
    final products = await _apiService.fetchProducts();

    emit(state.copyWith(productModel: products));
    emit(state.copyWith(isLoading: false));
  }
}
