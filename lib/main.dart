import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mdp_case_study/product/init/application_init.dart';
import 'package:mdp_case_study/product/init/languages/product_localization.dart';
import 'package:mdp_case_study/product/navigation/app_router.dart';

void main() async {
  await ApplicationInitialize().make();
  runApp(ProviderScope(child: ProductLocalization(child: MyApp())));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
