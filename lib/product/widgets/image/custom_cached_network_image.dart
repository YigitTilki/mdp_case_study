import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mdp_case_study/product/widgets/app_padding.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    required this.imageUrl,
    this.size,
    super.key,
  });

  final String? imageUrl;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: size?.width.w,
      height: size?.height.h,
      fit: BoxFit.cover,
      maxHeightDiskCache: 400,
      imageUrl: imageUrl ?? 'https://via.placeholder.com/300',
      placeholder: (context, url) => Padding(
        padding: AppPadding.allNormal(),
        child: const CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
