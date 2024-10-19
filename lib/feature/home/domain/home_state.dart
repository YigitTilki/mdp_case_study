import 'package:equatable/equatable.dart';
import 'package:mdp_case_study/feature/products/domain/product.dart';

class HomeState extends Equatable {
  const HomeState({
    this.productModel,
    this.isLoading = false,
  });

  final List<Product>? productModel;
  final bool isLoading;

  @override
  List<Object?> get props => [productModel, isLoading];

  HomeState copyWith({
    List<Product>? productModel,
    bool? isLoading,
  }) {
    return HomeState(
      productModel: productModel ?? this.productModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
