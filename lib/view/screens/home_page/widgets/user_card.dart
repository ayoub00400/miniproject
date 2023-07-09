import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    as app_localization;

import '../../../../models/user.dart';
import '../../../../utils/constants.dart';

class UserCard extends StatelessWidget {
  final User userData;
  final Function onTap;

  const UserCard({
    super.key,
    required this.userData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.2),
                  offset: const Offset(-1, 5),)
            ],
            color: Colors.blue.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),),
        margin: const EdgeInsets.all(8),
        height: 150,
        child: Row(children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(
              height: 70,
              width: 70,
              child:
                  CircleAvatar(backgroundImage: AssetImage(AppAssets.userIcon)),
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                children: [
                  Text(app_localization.AppLocalizations.of(context)!
                      .homeFirstNameTxt,),
                  Text(
                    userData.firstName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500,),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(app_localization.AppLocalizations.of(context)!
                      .homeLastTxt,),
                  Text(
                    userData.lastName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500,),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(app_localization.AppLocalizations.of(context)!
                      .homePagePhoneNumber,),
                  Text(
                    userData.phoneNumber,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500,),
                  ),
                ],
              ),
            ],),
          ),)
        ],),
      ),
    );
  }
}
