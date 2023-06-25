import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/componants/componants.dart';
import 'cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..loadHomePageUsers(),
      child:  Scaffold(
          appBar: AppBar(title: Text('Users List '),actions: []),
          body: SafeArea(child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if(state is LoadingHomePageUsers ){
                return  Container(
                  width: double.maxFinite,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('Fetching data ')
                    ],
                  ),
                );
              }else{
                if(state is LoadingHomePageUsersDone){
      
                  return RefreshIndicator( onRefresh:()async{
                    BlocProvider.of<HomeCubit>(context).loadHomePageUsers();
                  },
                
                
        child:ListView(children: BlocProvider.of<HomeCubit>(context).homePageUsers.map((userDataInstance) =>userListTileBuilder(context,userDataInstance) ).toList())) ;
                }else{
                  return Center(child: Text('Somthing Wrong hapend when fetching data'));
                }
              }
              
            },
          )),
        ),
      );
    
  }
}
