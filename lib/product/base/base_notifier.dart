import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseNotifier<T> extends StateNotifier<T> {
  BaseNotifier(super.initialState);

  void emit(T newState) {
    if (mounted) {
      state = newState;
    }
  }
}
