import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mdp_case_study/feature/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:mdp_case_study/feature/auth/presentation/widgets/top_field_text.dart';
import 'package:mdp_case_study/feature/products/application/products_view_model.dart';
import 'package:mdp_case_study/feature/products/domain/product.dart';
import 'package:mdp_case_study/product/constants/app_colors.dart';
import 'package:mdp_case_study/product/init/languages/locale_keys.g.dart';
import 'package:mdp_case_study/product/manager/validator_manager.dart';
import 'package:mdp_case_study/product/widgets/app_padding.dart';
import 'package:mdp_case_study/product/widgets/app_spacer.dart';
import 'package:mdp_case_study/product/widgets/image/custom_cached_network_image.dart';
import 'package:mdp_case_study/product/widgets/loading_indicator.dart';

class ProductModalSheet extends ConsumerWidget {
  ProductModalSheet({required this.product, super.key});

  final Product product;
  static Future<void> show(BuildContext context, Product product) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return ProductModalSheet(product: product);
      },
    );
  }

  final TextEditingController _titleController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productsNotifierProvider);
    final validator = ref.watch(validatorProvider);

    return Padding(
      padding: AppPadding.allLarge(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: CustomCachedNetworkImage(
              imageUrl: product.image,
              size: Size(200.w, 200.h),
            ),
          ),
          Text(
            product.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
          AppSpacer.vertical10(),
          Text(
            '\$${product.price}',
            style: const TextStyle(fontSize: 18),
          ),
          AppSpacer.vertical10(),
          Text(product.description),
          AppSpacer.vertical20(),
          const TopFieldText(title: LocaleKeys.products_title),
          Form(
            key: _formKey,
            child: CustomTextFormField(
              controller: _titleController,
              validator: validator.validateTitle,
            ),
          ),
          AppSpacer.vertical20(),
          if (state.isLoading)
            const LoadingIndicator()
          else
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  await _onPressed(ref, context);
                },
                child: Text(
                  LocaleKeys.products_change_title.tr(),
                ),
              ),
            ),
          AppSpacer.vertical30(),
        ],
      ),
    );
  }

  Future<void> _onPressed(WidgetRef ref, BuildContext context) async {
    final response =
        await ref.read(productsNotifierProvider.notifier).updateProduct(
              product.id,
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
  }
}
