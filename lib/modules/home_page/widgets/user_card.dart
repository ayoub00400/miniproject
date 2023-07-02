
import 'package:flutter/material.dart';



import 'package:flutter_gen/gen_l10n/app_localizations.dart' as app_localisation;
import 'package:mini_project_app/models/user.dart';


class UserCard extends StatelessWidget {
  final UserModel userData;
     late  Widget routeToPage;
   UserCard({super.key, required this.userData, required this.routeToPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>routeToPage,settings: RouteSettings( arguments:[userData])));
    },
    child: Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.2), offset: const Offset(-1, 5))], color: Colors.blue.withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
      
      margin:const EdgeInsets.all(8),
      height: 150,
      
      child: Row(children: [
         const Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(height: 70,
            width: 70,
              child: CircleAvatar(
                backgroundImage: 
                     AssetImage(
                        'assets/imgs/userprofile.jpg')),
              ),
            ),
                    Expanded(child: Container( padding: const EdgeInsets.symmetric(horizontal: 10),child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Row(
                        children: [
                           Text( app_localisation.AppLocalizations.of(context)!.homefirstnametxt),
                          Text(userData.firstName,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        ],
                      ),const SizedBox(height: 20), Row(children: [
                           Text(app_localisation.AppLocalizations.of(context)!.homelasttxt),
                          Text(userData.LastName,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        ],),
                        const SizedBox(height: 20), Row(children: [
                           Text(app_localisation.AppLocalizations.of(context)!.homepgonenumber),
                          Text(userData.phoneNumber,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        ],),
  
                    ]),))
  
      ]),
    ),
  );
  }
}