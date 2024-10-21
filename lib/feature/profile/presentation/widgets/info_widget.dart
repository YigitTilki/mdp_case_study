import 'package:flutter/material.dart';
import 'package:mdp_case_study/product/constants/app_colors.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({required this.header, required this.value, super.key});

  final String header;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
