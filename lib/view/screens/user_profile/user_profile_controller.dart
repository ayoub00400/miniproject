import 'package:get/get.dart';

import '../../../models/user.dart';
import '../../../repositories/user/user_repo_imp.dart';

class UserProfileController extends GetxController with StateMixin {
  User? userData;
  UserRepository userRepository = UserRepository();

  Future<void> getUserById() async {
    try {
      change(userData, status: RxStatus.loading());

      userData = await userRepository.getUserById(userData!.userId);

      change(userData, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error('error happened here'));
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    userData = Get.arguments;
  }
}
