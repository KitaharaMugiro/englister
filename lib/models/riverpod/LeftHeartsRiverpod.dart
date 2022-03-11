import 'package:englister/models/auth/AuthService.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

class LeftHeartsNotifier extends StateNotifier<num> {
  LeftHeartsNotifier() : super(_initialValue);
  static final num _initialValue = 0;
  void set(num heart) {
    state = heart;
  }
}

final leftHeartsProvider = StateNotifierProvider<LeftHeartsNotifier, num>(
  (ref) => LeftHeartsNotifier(),
);

class MaxHeartsNotifier extends StateNotifier<num> {
  MaxHeartsNotifier() : super(_initialValue);
  static final num _initialValue = 0;
  void set(num heart) {
    state = heart;
  }
}

final maxHeartsProvider = StateNotifierProvider<MaxHeartsNotifier, num>(
  (ref) => MaxHeartsNotifier(),
);
