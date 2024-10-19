import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/product/state/products/products_view_model.dart';

@RoutePage()
class ProductView extends ConsumerStatefulWidget {
  const ProductView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductViewState();
}

class _ProductViewState extends ConsumerState<ProductView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetch();
    });
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        _fetch();
      }
    });
  }

  Future<void> _fetch() async {
    if (!mounted) return;
    await ref.read(productsNotifierProvider.notifier).fetchProducts(10);
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productsNotifierProvider);

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        controller: scrollController,
        itemCount: (state.productModel?.length ?? 0) + 1,
        itemBuilder: (BuildContext context, int index) {
          final products = state.productModel ?? [];
          if (index < products.length) {
            final product = products[index];
            return SizedBox(
              height: 300,
              child: ListTile(
                title: Text(product.title),
              ),
            );
          } else {
            return state.hasMore
                ? const Center(child: CircularProgressIndicator())
                : const Text('No More Items');
          }
        },
      ),
    );
  }
}
