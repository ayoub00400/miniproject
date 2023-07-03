import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/localization/cubit/lang_cubit.dart';
import '../../shared/theming/cubit/theme_cubit.dart';
import '../../shared/utils/extensions/app_localization_context.dart';
import '../home_page/home_page.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginDone) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage()));
          } else {
            if (state is LoginFailed) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text(context.loc.loginFailed),
                        content: Text(context.loc.loginFailedContent),
                      ));
            }
          }
        },
        child: Scaffold(
          appBar: AppBar(actions: [
            BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
              return Switch(
                  value: BlocProvider.of<ThemeCubit>(context).darkMode
                      ? true
                      : false,
                  onChanged: (value) {
                    context.read<ThemeCubit>().changeAppTheme(value);
                  });
            }),
            const SizedBox(
              width: 10,
            ),
            BlocBuilder<LangCubit, LangState>(
              builder: (context, state) {
                return DropdownButton(
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
                      BlocProvider.of<LangCubit>(context)
                          .changeAppLang(langCode!);
                    });
              },
            )
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
                    BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            currentFocus.unfocus();
                            BlocProvider.of<LoginCubit>(context)
                                .authenticateUser(
                                    userNameTextFieldController.text,
                                    userPasswordFieldController.text);
                          },
                          child: state is LoginLoading
                              ? const SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                              : const Text('Login'));
                    })
                  ]),
            ),
          )),
        ),
      ),
    );
  }
}
