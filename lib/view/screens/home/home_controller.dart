import 'package:get/get.dart';
import '../../../models/user.dart';

import '../../../repositories/user/user_repo_imp.dart';

class HomeController extends GetxController with StateMixin<List<User>> {
  var homePageUsers = <User>[].obs;

  final userRepository = UserRepository();

  Future<void> loadHomePageUsers() async {
    try {
      change([], status: RxStatus.loading());
      homePageUsers.value = [];

      homePageUsers.value = await userRepository.getAllUsers();
      update(['usersList']);
      if (homePageUsers.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(homePageUsers, status: RxStatus.success());
      }
    } catch (e) {
      change([], status: RxStatus.error('there is  error triggered'));
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadHomePageUsers();
  }
}
