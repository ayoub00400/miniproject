import 'package:flutter/material.dart';
import 'package:mini_project_app/models/usermodel.dart';

import '../../modules/userprofilepage/userprofilepage.dart';

Widget userListTileBuilder(BuildContext context,UserModel userData) {
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserProfilePage()));
    },
    child: Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.2), offset: Offset(-1, 5))], color: Colors.blue.withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
      
      margin:EdgeInsets.all(8),
      height: 150,
      
      child: Row(children: [
        Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(height: 70,
            width: 70,
              child: CircleAvatar(
                backgroundImage: 
                     NetworkImage(
                        'https://static.vecteezy.com/system/resources/thumbnails/005/545/335/small/user-sign-icon-person-symbol-human-avatar-isolated-on-white-backogrund-vector.jpg')),
              ),
            ),
                    Expanded(child: Container( padding: EdgeInsets.symmetric(horizontal: 10),child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Row(
                        children: [
                          Text('First Name :'),
                          Text(userData.userFullName['firstname'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        ],
                      ),SizedBox(height: 20), Row(children: [
                          Text('Lasr Name :'),
                          Text(userData.userFullName['lastname'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        ],),
                        SizedBox(height: 20), Row(children: [
                          Text('Phone Number :'),
                          Text(userData.phoneNumber,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        ],),
  
                    ]),))
  
      ]),
    ),
  );
}
