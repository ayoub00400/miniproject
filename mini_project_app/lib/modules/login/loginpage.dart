import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_app/shared/internationalisme/cubit/lang_cubit.dart';
import 'package:mini_project_app/shared/theming/cubit/theme_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home/homepage.dart';
import 'cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  TextEditingController userNameTextFieldCotroller = TextEditingController(text:"Ayoub004" );
  TextEditingController userPasswordFieldCotroller = TextEditingController(text: "Ayoub0041");

  LoginPage({super.key});

  //const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var langDelegate = AppLocalizations.of(context)!;
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
                        title: Text(langDelegate.loginfailed),
                        content: Text(langDelegate.loginfailedcontent),
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
            }),const SizedBox(width: 10,),
            BlocBuilder<LangCubit, LangState>(
              builder: (context, state) {
                return DropdownButton(icon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.language),
                ), hint:const Text('Lang') , items: const [
                  DropdownMenuItem(value: 'en', child: Text('en')),
                  DropdownMenuItem(value: 'ar', child: Text('ar'))
                ], onChanged: (langCode) {

                   BlocProvider.of<LangCubit>(context).changeAppLang(langCode!);
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
                          langDelegate.loginheader,
                          style: const TextStyle(fontSize: 40),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          langDelegate.loginphrase,
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.grey.withOpacity(.88)),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: userNameTextFieldCotroller,
                      decoration: InputDecoration(
                          label: Text(langDelegate.username),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          filled: true,
                          fillColor: Colors.blue.withOpacity(.09)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: userPasswordFieldCotroller,
                      decoration: InputDecoration(
                          label: Text(langDelegate.password),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          filled: true,
                          fillColor: Colors.blue.withOpacity(.09)),
                    ),
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
                                .authanticateUser(
                                    userNameTextFieldCotroller.text,
                                    userPasswordFieldCotroller.text);
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
