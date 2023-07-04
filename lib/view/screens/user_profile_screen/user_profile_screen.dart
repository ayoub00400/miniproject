import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user.dart';
import 'user_profile_controller.dart';
import 'widgets/user_profile_body.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    User userData = ModalRoute.of(context)!.settings.arguments as User;
    UserProfileController controller = Get.put(UserProfileController());

    return Scaffold(
      appBar: AppBar(
        title: Text('profileTxt'.tr),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getUserById(userData.userId);
        },
        child: GetBuilder<UserProfileController>(
          builder: (controller) {
            if (controller.userData == null) {
              return UserProfileBody(
                userData: userData,
              );
            } else {
              return controller.obx(
                (state) {
                  return UserProfileBody(userData: controller.userData!);
                },
                onError: (error) => Center(child: Text(error!)),
                onLoading: const Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
      ),
    );
  }
}
