// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mdp_case_study/product/model/product.dart';

class ProductsState extends Equatable {
  const ProductsState({
    this.productModel,
    this.isLoading = false,
    this.skip = 0,
    this.hasMore = true,
  });

  final List<Product>? productModel;
  final bool isLoading;
  final int skip;
  final bool hasMore;

  @override
  List<Object?> get props => [productModel, isLoading, skip, hasMore];

  ProductsState copyWith({
    List<Product>? productModel,
    bool? isLoading,
    int? skip,
    bool? hasMore,
  }) {
    return ProductsState(
      productModel: productModel ?? this.productModel,
      isLoading: isLoading ?? this.isLoading,
      skip: skip ?? this.skip,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
