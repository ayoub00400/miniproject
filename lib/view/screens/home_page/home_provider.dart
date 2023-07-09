import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user.dart';
import '../../../repositories/user/user_repo_imp.dart';

List<User>? users;

FutureOr<List<User>?> loadHomePageUsers() async {
  try {
    final userRepository = UserRepository();

    users = await userRepository.getAllUsers();
  } catch (e) {
    Exception();
  }
  return users;
}

var homeStateProvider = StateProvider<List<User>?>((ref) => users);

var homeFutureProvider = FutureProvider((ref) async {
  return loadHomePageUsers();
});
