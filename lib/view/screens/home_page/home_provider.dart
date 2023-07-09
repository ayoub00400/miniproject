import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user.dart';
import '../../../repositories/user/user_repo_imp.dart';

List<User>? users;

Future<List<User>?> loadHomePageUsers() async {
  try {
    final userRepository = UserRepository();
    users = null;

    users = await userRepository.getAllUsers();
    print('im fetshing data' + users.toString());
    return users;
  } catch (e) {}
}

var homeProvider = StateProvider<List<User>?>((ref) => users);

var homeFutureProvider = FutureProvider((ref) async {
  return loadHomePageUsers();
});
