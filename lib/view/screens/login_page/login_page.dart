import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_project_app/view/screens/home_page/home_page.dart';
import 'package:mini_project_app/view/screens/login_page/login_provider.dart';

import '../../../config/language/providers/lang_provider.dart';
import '../../../config/theme/theme_provider.dart';
import '../../../utils/extensions/app_localization_context.dart';
import 'widgets/input_field.dart';

class LoginPage extends ConsumerWidget {
  final TextEditingController userNameTextFieldController =
      TextEditingController(text: 'Ayoub004');
  final TextEditingController userPasswordFieldController =
      TextEditingController(text: 'Ayoub0041');

  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    ref.listen(loginProvider, (previous, next) {
      next.whenData((value) {
        if (value == true) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const HomePage()));
        }
      });
    });
    return Scaffold(
        appBar: AppBar(actions: [
          Switch(
              value: ref.watch(themeProvider),
              onChanged: (value) {
                ref.watch(themeProvider.notifier).changeAppTheme(value);
              }),
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
                ref.watch(langProvider.notifier).changeAppLang(langCode!);
              })
        ]),
        body: SafeArea(
          child: Container(
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          context.loc.loginHeader,
                          style: const TextStyle(fontSize: 40),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          context.loc.loginPhrase,
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.grey.withOpacity(.88)),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFieldWidget(
                        controller: userNameTextFieldController,
                        label: context.loc.username),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFieldWidget(
                        controller: userPasswordFieldController,
                        label: context.loc.password),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          currentFocus.unfocus();
                          ref.read(loginProvider.notifier).authenticateUser(
                              userNameTextFieldController.text,
                              userPasswordFieldController.text);
                        },
                        child: ref.watch(loginProvider).when(
                              data: (data) {
                                return const Text('Login');
                              },
                              error: (error, stackTrace) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(error.toString())));
                                return null;
                              },
                              loading: () => const CircularProgressIndicator(
                                  color: Colors.purple),
                            )),
                  ]))),
        ));
  }
}
