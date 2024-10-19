import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/feature/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:mdp_case_study/feature/products/application/products_view_model.dart';
import 'package:mdp_case_study/feature/products/domain/product.dart';
import 'package:mdp_case_study/product/navigation/app_router.dart';
import 'package:mdp_case_study/product/widgets/app_padding.dart';

class ModalSheet extends ConsumerStatefulWidget {
  const ModalSheet({required this.product, super.key});

  final Product product;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ModalSheetState();

  static Future<void> show(BuildContext context, Product product) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return ModalSheet(product: product);
      },
    );
  }
}

class _ModalSheetState extends ConsumerState<ModalSheet> {
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productsNotifierProvider);

    return Padding(
      padding: AppPadding.allLarge(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Price: \$${widget.product.price}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(widget.product.description),
          const SizedBox(height: 20),
          CustomTextFormField(controller: _titleController),
          ElevatedButton(
            onPressed: () async {
              final response = await ref
                  .read(productsNotifierProvider.notifier)
                  .updateProduct(
                    widget.product.id,
                    _titleController.text,
                  );

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(response),
                  ),
                );
                await context.router.maybePop();
              }
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
