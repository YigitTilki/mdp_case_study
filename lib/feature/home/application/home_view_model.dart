import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/feature/home/data/home_service.dart';
import 'package:mdp_case_study/feature/home/domain/home_state.dart';
import 'package:mdp_case_study/product/base/base_notifier.dart';

final homeNotifierProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  return HomeViewModel();
});

class HomeViewModel extends BaseNotifier<HomeState> {
  HomeViewModel() : super(const HomeState());

  final _apiService = HomeService();

  Future<void> get10Product() async {
    emit(state.copyWith(isLoading: true));
    final products = await _apiService.fetchProducts();

    if (products == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    emit(state.copyWith(productModel: products, isLoading: false));
  }
}
