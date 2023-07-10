import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user.dart';
import '../../repositories/user/user_repo_imp.dart';

final FutureProviderFamily<User?, int> userFutureProvider = FutureProvider.family<User?, int>((ref, id) async {
  return await UserRepository().getUserById(id);
});
