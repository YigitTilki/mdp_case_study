import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/feature/products/application/products_view_model.dart';
import 'package:mdp_case_study/feature/products/presentation/widgets/product_container.dart';
import 'package:mdp_case_study/feature/widgets/product_modal_sheet.dart';
import 'package:mdp_case_study/product/widgets/app_padding.dart';

class ProductList extends ConsumerWidget {
  const ProductList({required this.scrollController, super.key});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productsNotifierProvider);

    return ListView.builder(
      controller: scrollController,
      itemCount: (state.productModel?.length ?? 0) + 1,
      padding: AppPadding.allNormal(),
      itemBuilder: (BuildContext context, int index) {
        final products = state.productModel ?? [];
        if (index < products.length) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                ProductModalSheet.show(context, product);
              },
              child: ProductContainer(product: product),
            ),
          );
        } else {
          return state.hasMore
              ? const Center(child: CircularProgressIndicator())
              : const Text('No More Items');
        }
      },
    );
  }
}
