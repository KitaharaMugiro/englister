import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

class PhrasesNotifier extends StateNotifier<List<dynamic>> {
  PhrasesNotifier() : super(_initialValue);
  static final List<dynamic> _initialValue = [];
  void set(List<dynamic> phrases) {
    state = phrases;
  }
}

final phrasesProvider = StateNotifierProvider<PhrasesNotifier, List<dynamic>>(
  (ref) => PhrasesNotifier(),
);

//使い方
//var user = ref.watch(userProvider);
// → user
//var userNotifier = ref.watch(userProvider.notifier);
// → userNotifier.set(XXX)