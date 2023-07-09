import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginProvider extends AsyncNotifier<bool?> {
  bool? isAuthicated;

  @override
  FutureOr<bool?> build() {
    return Future.value(null);
  }

  void authenticateUser(String userName, String userPassword) async {
    try {
      String userNameFake = 'Ayoub004';
      String userPasswordFake = 'Ayoub0041';
      state = const AsyncValue.loading();
      await Future.delayed(const Duration(seconds: 1), (() {
        if (userName == userNameFake && userPassword == userPasswordFake) {
          isAuthicated = true;
          state = const AsyncValue.data(true);
        } else {
          state = AsyncValue.error('wrong creadiantials', StackTrace.current);
        }
      }));
    } catch (e) {
      state = AsyncValue.error('error happend', StackTrace.current);
    }
  }
}

var loginProvider = AsyncNotifierProvider<LoginProvider, bool?>(() {
  return LoginProvider();
});
