import 'package:englister/models/auth/AuthService.dart';
import 'package:riverpod/riverpod.dart';

class UserNotifier extends StateNotifier<UserAttribute> {
  UserNotifier() : super(_initialValue);
  static UserAttribute _initialValue = UserAttribute();
  void setUser(UserAttribute user) {
    state = user;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserAttribute>(
  (ref) => UserNotifier(),
);
