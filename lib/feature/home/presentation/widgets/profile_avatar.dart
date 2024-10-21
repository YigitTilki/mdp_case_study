import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mdp_case_study/feature/auth/domain/user.dart';
import 'package:mdp_case_study/product/constants/app_colors.dart';
import 'package:mdp_case_study/product/widgets/image/custom_cached_network_image.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({required this.user, super.key});
  final User? user;

  @override
  Widget build(BuildContext context) {
    final isFemale = user?.gender == 'female';
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 140.w,
          height: 120.h,
        ),
        ClipOval(
          child: CustomCachedNetworkImage(
            size: const Size(120, 120),
            imageUrl: user?.image,
          ),
        ),
        Positioned(
          right: 0.w,
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              border: Border.all(width: 4, color: AppColors.greyColor),
              shape: BoxShape.circle,
              color: AppColors.redColor,
            ),
            child: Icon(
              isFemale ? Icons.female : Icons.male,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
