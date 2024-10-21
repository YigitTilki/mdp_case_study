import 'package:flutter/material.dart';
import 'package:mdp_case_study/feature/auth/domain/user.dart';
import 'package:mdp_case_study/product/constants/app_colors.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({required this.user, super.key});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        textColor: Colors.black,
        title: Text(
          user?.firstName ?? 'Angelica Jackson',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
          ),
        ),
        subtitle: Text(
          user?.email ?? 'angelica.jackson@gmail.com',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryTextColor,
          ),
        ),
      ),
    );
  }
}
