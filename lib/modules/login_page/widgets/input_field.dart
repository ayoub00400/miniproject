
import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget{
  TextEditingController? controller;
  late String labaltxt;
   InputFieldWidget({this.controller, required this.labaltxt});
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                          label: Text(labaltxt),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          filled: true,
                          fillColor: Colors.blue.withOpacity(.09)),
                    );
  }

}