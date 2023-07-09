import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_project_app/repositories/user/user_repo_imp.dart';

import '../../../models/user.dart';
import '../user_profile_page/user_profile_page.dart';
import 'home_provider.dart';

import 'widgets/user_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var langDelegate = AppLocalizations.of(context)!;
    var users = ref.watch(homeFutureProvider);

    return Scaffold(
        appBar: AppBar(title: Text(langDelegate.homePageTitle)),
        body: SafeArea(
            child: Container(
                height: double.infinity,
                child: RefreshIndicator(
                  onRefresh: () async {
                    var newState = await ref.refresh(homeFutureProvider.future);

                    ref
                        .watch(homeProvider.notifier)
                        .update((state) => state = newState);
                  },
                  child: users.when(
                    data: (data) {
                      if (users.isRefreshing || data == null) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (data.isEmpty) {
                        return ListView(
                          children: [
                            SizedBox(
                              height: 350,
                            ),
                            Center(
                              child: Text('Data is Empty !'),
                            ),
                          ],
                        );
                      } else {
                        return ListView.builder(
                            itemCount:
                                ref.watch(homeProvider.notifier).state!.length,
                            itemBuilder: (context, index) {
                              return UserCard(
                                userData: data[index],
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const UserProfilePage(),
                                      settings: RouteSettings(
                                          arguments: data[index])));
                                },
                              );
                            });
                      }
                    },
                    error: (error, stackTrace) {
                      return ListView(
                        children: [
                          SizedBox(
                            height: 200,
                          ),
                          Center(
                            child: Text(error.toString()),
                          )
                        ],
                      );
                    },
                    loading: () {
                      return ListView(
                        children: [
                          SizedBox(
                            height: 300,
                          ),
                          Center(child: CircularProgressIndicator()),
                        ],
                      );
                    },
                  ),
                ))));
  }
}
