import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:mini_project_app/modules/login/loginpage.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage()
    );
  }
}