import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/homepage.dart';
import 'cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  TextEditingController userNameTextFieldCotroller = TextEditingController();
  TextEditingController userPasswordFieldCotroller = TextEditingController();
  
  //const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginDone){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
          }else{
            if(state is LoginFailed){
              showDialog(context: context, builder:(context)=>AlertDialog(title: Text('Login Failed!!'),content: Text('Wrong username or password please try again.'),) );
            }
          }
        },
        child: Scaffold(
          body: SafeArea(
              child: Container(
            alignment: AlignmentDirectional.center,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 40),
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "stay connected to catch the news ",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.grey.withOpacity(.88)),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: userNameTextFieldCotroller,
                      decoration: InputDecoration(
                          label: Text('Username:'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          filled: true,
                          fillColor: Colors.blue.withOpacity(.09)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: userPasswordFieldCotroller,
                      decoration: InputDecoration(
                          label: Text('Password:'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          filled: true,
                          fillColor: Colors.blue.withOpacity(.09)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            return   ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          currentFocus.unfocus();
                            BlocProvider.of<LoginCubit>(context).authanticateUser(userNameTextFieldCotroller.text,userPasswordFieldCotroller.text );
                        },
                        child: 
                            state is LoginLoading?
                              SizedBox(height: 15,width: 15, child: CircularProgressIndicator(color: Colors.white,)):
                            
                               Text('Login')
                            
                          
                            
                   
                        );
  })]),
            ),
          )),
        ),
      ),
    );
  }
}
