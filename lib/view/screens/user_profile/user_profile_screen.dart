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
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            userProfileController.getUserById();
          },
          child: userProfileController.obx(
            (state) {
              return UserProfileBody(
                userData: userProfileController.userData,
              );
            },
            onError: (error) => ListView(
              children: [
                SizedBox(height: Get.height * .4),
                Center(child: Text(error!))
              ],
            ),
            onLoading: const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
