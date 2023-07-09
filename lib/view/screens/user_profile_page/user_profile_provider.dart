import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user.dart';
import '../../../repositories/user/user_repo_imp.dart';

User? newUserData;

FutureOr<User?> getUserById(int userId) async {
  try {
    newUserData = null;
    newUserData = await UserRepository().getUserById(userId);
  } catch (e) {
    Exception();
  }
  return newUserData;
}

var userProvider = StateProvider<User?>((ref) => newUserData);

final FutureProviderFamily<User?, int> userFutureProvider =
    FutureProvider.family<User?, int>((ref, id) {
  return getUserById(id);
});
