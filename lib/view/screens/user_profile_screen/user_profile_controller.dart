import 'package:get/get.dart';

import '../../../models/user.dart';
import '../../../repositories/user/user_repo_imp.dart';

class UserProfileController extends GetxController with StateMixin {
  User? userData;

  void getUserById(int userId) {
    try {
      change(userData, status: RxStatus.loading());
      UserRepository().getUserById(userId).then((data) {
        userData = data;
        change(userData, status: RxStatus.success());
      });
    } catch (e) {
      change(null, status: RxStatus.error('error happened here'));
    }
  }
}
