import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/feature/products/application/products_view_model.dart';
import 'package:mdp_case_study/feature/products/presentation/widgets/product_list.dart';
import 'package:mdp_case_study/feature/widgets/custom_app_bar.dart';
import 'package:mdp_case_study/product/constants/app_colors.dart';
import 'package:mdp_case_study/product/init/languages/locale_keys.g.dart';
import 'package:mdp_case_study/product/widgets/app_padding.dart';
import 'package:mdp_case_study/product/widgets/loading_indicator.dart';

part 'product_view_mixin.dart';

@RoutePage()
class ProductView extends ConsumerStatefulWidget {
  const ProductView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductViewState();
}

class _ProductViewState extends ConsumerState<ProductView>
    with _ProductViewMixin {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productsNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CustomAppBar(
        title: LocaleKeys.products_products,
      ),
      body: state.isLoading && state.productModel == null
          ? const LoadingIndicator()
          : Padding(
              padding: AppPadding.symVLarge(),
              child: ProductList(scrollController: scrollController),
            ),
    );
  }
}
