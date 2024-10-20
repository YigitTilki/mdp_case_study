import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/feature/auth/application/auth_view_model.dart';
import 'package:mdp_case_study/product/init/languages/locale_keys.g.dart';

class RememberMe extends ConsumerWidget {
  const RememberMe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authNotifierProvider);
    final notifier = ref.read(authNotifierProvider.notifier);
    return Row(
      children: [
        Checkbox.adaptive(
          value: state.rememberMe,
          onChanged: (value) {
            notifier.changeRememberMe(value: value ?? false);
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(LocaleKeys.auth_remember_me.tr()),
      ],
    );
  }
}
