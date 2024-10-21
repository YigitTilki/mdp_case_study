// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mdp_case_study/feature/products/domain/product.dart';

class ProductsState extends Equatable {
  const ProductsState({
    this.response,
    this.productModel,
    this.isLoading = false,
    this.skip = 0,
    this.hasMore = true,
    this.limit = 10,
  });

  final List<Product>? productModel;
  final bool isLoading;
  final int skip;
  final bool hasMore;
  final String? response;
  final int limit;

  @override
  List<Object?> get props {
    return [
      productModel,
      isLoading,
      skip,
      hasMore,
      response,
      limit,
    ];
  }

  ProductsState copyWith({
    List<Product>? productModel,
    bool? isLoading,
    int? skip,
    bool? hasMore,
    String? response,
  }) {
    return ProductsState(
      productModel: productModel ?? this.productModel,
      isLoading: isLoading ?? this.isLoading,
      skip: skip ?? this.skip,
      hasMore: hasMore ?? this.hasMore,
      response: response ?? this.response,
    );
  }
}
