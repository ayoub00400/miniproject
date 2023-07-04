import 'package:get/get.dart';

import '../home_screen/home_screen.dart';

class LoginController extends GetxController {
  String userNameFake = 'Ayoub004';
  String userPasswordFake = 'Ayoub0041';
  Rx<bool> isLoading = false.obs;

  void authenticateUser(String userName, String userPassword) {
    isLoading.value = true;
    Future.delayed(
      const Duration(seconds: 1),
      (() {
        if (userName == userNameFake && userPassword == userPasswordFake) {
          Future.delayed(
            const Duration(seconds: 1),
            () {
              isLoading.value = false;
              update();
              Get.to(const HomeScreen());
            },
          );
        } else {
          Get.snackbar('Login failed', 'username or password wrong try again ');
        }
      }),
    );
  }
}
