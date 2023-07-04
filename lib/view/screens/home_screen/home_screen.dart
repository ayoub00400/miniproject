import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../user_profile_screen/user_profile_screen.dart';
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const UserProfilePage(),
                        settings: RouteSettings(
                          arguments: users[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            onLoading: const Center(
              child: CircularProgressIndicator(),
            ),
            onError: (error) => Stack(
              children: [
                ListView(
                  children: const [],
                ),
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
