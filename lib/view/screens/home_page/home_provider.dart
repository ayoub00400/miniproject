
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/user/user_repo_imp.dart';

var homeFutureProvider = FutureProvider((ref) async {
  final userRepository = UserRepository();
  return await userRepository.getAllUsers();
});
