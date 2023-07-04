import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../user_profile/user_profile_screen.dart';
import 'home_controller.dart';
import 'widgets/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(title: Text('homePageTitle'.tr), actions: const []),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            homeController.loadHomePageUsers();
          },
          child: homeController.obx(
            (users) => ListView.builder(
              itemCount: users!.length,
              itemBuilder: (context, index) {
                return UserCard(
                  userData: users[index],
                  onTap: () {
                    Get.to(
                      () => const UserProfilePage(),
                      arguments: users[index],
                    );
                  },
                );
              },
            ),
            onLoading: const Center(
              child: CircularProgressIndicator(),
            ),
            onError: (error) => ListView(
              children: [
                SizedBox(height: Get.height * 0.4),
                Center(
                  child: Text(error!),
                )
              ],
            ),
            onEmpty: const Center(
              child: Text('Empty !!!'),
            ),
          ),
        ),
      ),
    );
  }
}
