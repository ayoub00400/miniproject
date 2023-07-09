import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user.dart';
import '../../../repositories/user/user_repo_imp.dart';

User? newUserData;

Future<User?> getUserById(int userId) async {
  try {
    newUserData = await UserRepository().getUserById(userId);
    return newUserData;
  } catch (e) {}
}

var userProvider = StateProvider<User?>((ref) => newUserData);

final FutureProviderFamily<User?, int> userFutureProvider =
    FutureProvider.family<User?, int>((ref, id) {
  return getUserById(id);
});
