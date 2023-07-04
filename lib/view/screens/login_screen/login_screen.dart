import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/language/localization_service.dart';
import '../../../config/theme/theme_controller.dart';
import 'login_controller.dart';
import 'widgets/input_field.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController userNameTextFieldController =
      TextEditingController(text: 'Ayoub004');
  final TextEditingController userPasswordFieldController =
      TextEditingController(text: 'Ayoub0041');

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        actions: [
          GetX<ThemeController>(
            builder: (themeController) => Switch(
              value: themeController.darkMode.value,
              onChanged: (value) {
                themeController.darkMode.value = value;
                Get.find<ThemeController>().changeAppTheme(value);
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          DropdownButton(
            icon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.language),
            ),
            hint: const Text('Lang'),
            items: const [
              DropdownMenuItem(value: 'en', child: Text('en')),
              DropdownMenuItem(value: 'ar', child: Text('ar'))
            ],
            onChanged: (langCode) {
              Get.updateLocale(
                LocalizationService().getLocaleFromLanguage(langCode!),
              );
              LocalizationService.saveLanguage(langCode);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'loginHeader'.tr,
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'loginPhrase'.tr,
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.grey.withOpacity(.88),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InputFieldWidget(
                  controller: userNameTextFieldController,
                  label: 'username'.tr,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputFieldWidget(
                  controller: userPasswordFieldController,
                  label: 'password'.tr,
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<LoginController>(
                  builder: (loginController) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        currentFocus.unfocus();
                        loginController.authenticateUser(
                          userNameTextFieldController.text,
                          userPasswordFieldController.text,
                        );
                      },
                      child: GetX<LoginController>(
                        builder: (loginController) =>
                            loginController.isLoading.value
                                ? const SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text('Login'),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
