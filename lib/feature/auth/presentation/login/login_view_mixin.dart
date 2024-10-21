import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/feature/auth/application/auth_view_model.dart';
import 'package:mdp_case_study/feature/auth/presentation/login/login_view.dart';
import 'package:mdp_case_study/product/manager/shared_pref_manager.dart';
import 'package:mdp_case_study/product/navigation/app_router.dart';

mixin LoginViewMixin on ConsumerState<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  late final SharedPrefManager _sharedPrefManager;

  @override
  void initState() {
    super.initState();
    _sharedPrefManager = SharedPrefManager();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final credentials = await _sharedPrefManager.loadCredentials();

    setState(() {
      if (credentials?.email != null) {
        emailController.text = credentials?.email ?? '';
      }

      if (credentials?.password != null) {
        passwordController.text = credentials?.password ?? '';
      }

      if (credentials?.rememberMe != null) {
        ref
            .read(authNotifierProvider.notifier)
            .changeRememberMe(value: credentials?.rememberMe ?? false);
      }
    });
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    final response = await ref
        .read(authNotifierProvider.notifier)
        .login(emailController.text, passwordController.text);

    if (response) {
      await pref();

      if (!mounted) return;
      await context.router.replace(const HomeRoute());
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to login'),
        ),
      );
    }
  }

  Future<void> pref() async {
    final state = ref.watch(authNotifierProvider);
    if (state.rememberMe!) {
      await _sharedPrefManager.saveCredentials(
        emailController.text,
        passwordController.text,
        rememberMe: state.rememberMe ?? false,
      );
    } else {
      await _sharedPrefManager.clearCredentials();
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
