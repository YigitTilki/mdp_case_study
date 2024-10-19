import 'package:flutter/material.dart';
import 'package:mdp_case_study/feature/products/domain/product.dart';
import 'package:mdp_case_study/product/constants/app_colors.dart';
import 'package:mdp_case_study/product/widgets/image/custom_cached_network_image.dart';

class HomeProductContainer extends StatelessWidget {
  const HomeProductContainer({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.greyColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Align(
              alignment: AlignmentDirectional.center,
              child: CustomCachedNetworkImage(imageUrl: product.image),
            ),
          ),
          Expanded(
            child: Text(
              product.title,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
          Expanded(
            child: Text(
              product.description,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: AppColors.labelGreyColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            '\$${product.price}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
