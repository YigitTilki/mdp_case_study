import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mdp_case_study/feature/auth/application/auth_view_model.dart';
import 'package:mdp_case_study/product/manager/shared_pref_manager.dart';
import 'package:mdp_case_study/feature/home/presentation/widgets/profile_avatar.dart';
import 'package:mdp_case_study/feature/profile/presentation/widgets/info_widget.dart';
import 'package:mdp_case_study/feature/widgets/language_modal_sheet.dart';
import 'package:mdp_case_study/product/constants/app_colors.dart';
import 'package:mdp_case_study/product/init/languages/locale_keys.g.dart';
import 'package:mdp_case_study/product/navigation/app_router.dart';
import 'package:mdp_case_study/product/widgets/app_padding.dart';
import 'package:mdp_case_study/product/widgets/app_spacer.dart';

@RoutePage()
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authNotifierProvider).userModel;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      body: Center(
        child: Padding(
          padding: AppPadding.allLarge(),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(child: ProfileAvatar(user: user)),
                AppSpacer.vertical20(),
                InfoWidget(
                  header: '${LocaleKeys.profile_first_name.tr()}:',
                  value: user?.firstName ?? 'Angelica',
                ),
                AppSpacer.vertical10(),
                InfoWidget(
                  header: '${LocaleKeys.profile_last_name.tr()}:',
                  value: user?.lastName ?? 'Angelica',
                ),
                AppSpacer.vertical10(),
                InfoWidget(
                  header: '${LocaleKeys.profile_user_name.tr()}:',
                  value: user?.username ?? 'Emily',
                ),
                AppSpacer.vertical10(),
                InfoWidget(
                  header: '${LocaleKeys.profile_email.tr()}:',
                  value: user?.email ?? 'Angelica@gmail.com',
                ),
                AppSpacer.vertical10(),
                InfoWidget(
                  header: '${LocaleKeys.profile_gender.tr()}:',
                  value: user?.gender ?? 'Erkek',
                ),
                AppSpacer.vertical10(),
                const Divider(),
                InkWell(
                  onTap: () {
                    LanguageModalSheet.show(context);
                  },
                  child: SizedBox(
                    height: 30.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.profile_change_language.tr(),
                          style: TextStyle(
                            color: AppColors.labelGreyColor,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: AppColors.labelGreyColor,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () async {
                    await SharedPrefManager().clearCredentials();
                    ref
                        .read(authNotifierProvider.notifier)
                        .changeRememberMe(value: false);
                    if (!context.mounted) return;
                    await context.router.replaceAll([const AuthRoute()]);
                  },
                  child: SizedBox(
                    height: 30.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.profile_logout.tr(),
                          style: TextStyle(
                            color: AppColors.labelGreyColor,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: AppColors.labelGreyColor,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
