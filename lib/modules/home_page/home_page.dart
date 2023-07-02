import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mini_project_app/modules/home_page/widgets/user_card.dart';
import 'package:mini_project_app/modules/user_profile_page/user_profile_page.dart';


import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var langDelegate=AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => HomeCubit()..loadHomePageUsers(),
      child:  Scaffold(
          appBar: AppBar(title: Text(langDelegate.homepagetitle),actions: const []),
          body: SafeArea(child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if(state is LoadingHomePageUsers ){
                return  SizedBox(
                  width: double.maxFinite,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 5,),
                      Text(langDelegate. homepageloadingtext )
                    ],
                  ),
                );
              }else{
                if(state is LoadingHomePageUsersDone){
      
                  return RefreshIndicator( onRefresh:()async{
                    BlocProvider.of<HomeCubit>(context).loadHomePageUsers();
                  },
                
                
        child:ListView(children: BlocProvider.of<HomeCubit>(context).homePageUsers.map((userDataInstance) =>UserCard(userData:userDataInstance,routeToPage: UserProfilePage(),) ).toList())) ;
                }else{
                  return Center(child: Text(langDelegate.homepageloeadinfailed ));
                }
              }
              
            },
          )),
        ),
      );
    
  }
}
