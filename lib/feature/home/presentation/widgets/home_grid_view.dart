import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/feature/home/presentation/widgets/home_product_container.dart';
import 'package:mdp_case_study/feature/home/application/home_view_model.dart';

class HomeGridView extends ConsumerWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeNotifierProvider).productModel;

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.70,
      ),
      itemCount: state?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final product = state![index];
        return Padding(
          padding: const EdgeInsets.all(8),
          child: HomeProductContainer(product: product),
        );
      },
    );
  }
}
