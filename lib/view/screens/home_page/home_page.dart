import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../user_profile_page/user_profile_page.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';
import 'widgets/user_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var langDelegate = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => HomeCubit()..loadHomePageUsers(),
      child: Scaffold(
        appBar:
            AppBar(title: Text(langDelegate.homePageTitle), actions: const []),
        body: SafeArea(child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is LoadingHomePageUsers) {
              return SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(langDelegate.homePageLoadingText)
                  ],
                ),
              );
            } else {
              if (state is LoadingHomePageUsersDone) {
                return RefreshIndicator(
                    onRefresh: () async {
                      BlocProvider.of<HomeCubit>(context).loadHomePageUsers();
                    },
                    child: ListView.builder(
                        itemCount: BlocProvider.of<HomeCubit>(context)
                            .homePageUsers
                            .length,
                        itemBuilder: (context, index) {
                          return UserCard(
                            userData: BlocProvider.of<HomeCubit>(context)
                                .homePageUsers[index],
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const UserProfilePage(),
                                  settings: RouteSettings(
                                      arguments:
                                          BlocProvider.of<HomeCubit>(context)
                                              .homePageUsers[index])));
                            },
                          );
                        }));
              } else {
                return Center(child: Text(langDelegate.homePageLoadingFailed));
              }
            }
          },
        )),
      ),
    );
  }
}
