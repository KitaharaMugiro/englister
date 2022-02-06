import 'package:englister/models/auth/AuthService.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

class UserNotifier extends StateNotifier<UserAttribute> {
  UserNotifier() : super(_initialValue);
  static final UserAttribute _initialValue = UserAttribute();
  void set(UserAttribute user) {
    state = user;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserAttribute>(
  (ref) => UserNotifier(),
);

//使い方
//var user = ref.watch(userProvider);
// → user
//var userNotifier = ref.watch(userProvider.notifier);
// → userNotifier.set(XXX)