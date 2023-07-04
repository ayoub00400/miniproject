import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_profile_controller.dart';
import 'widgets/user_profile_body.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserProfileController userProfileController =
        Get.put(UserProfileController());

    return Scaffold(
      appBar: AppBar(
        title: Text('profileTxt'.tr),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          userProfileController.getUserById();
        },
        child: userProfileController.obx(
          (state) {
            if (state.isBlank) {
              return UserProfileBody(
                userData: userProfileController.userData!,
              );
            } else {
              return UserProfileBody(
                userData: userProfileController.userData!,
              );
            }
          },
          onError: (error) => Center(child: Text(error!)),
          onLoading: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
