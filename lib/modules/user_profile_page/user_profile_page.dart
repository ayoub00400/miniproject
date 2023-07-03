import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/user.dart';
import 'cubit/user_profile_cubit.dart';
import 'cubit/user_profile_state.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<User> userData =
        ModalRoute.of(context)!.settings.arguments as List<User>;
    return BlocProvider(
        create: (context) => UserProfileCubit(),
        child: Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.profileTxt),
            ),
            body: BlocBuilder<UserProfileCubit, UserProfileState>(
              builder: (context, state) {
                return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<UserProfileCubit>(context)
                        .getUserById(userData[0].userId);
                  },
                  child: BlocBuilder<UserProfileCubit, UserProfileState>(
                    builder: (context, state) {
                      if (state is LoadingUserPageLoading) {
                        return const SafeArea(
                            child: Center(
                          child: CircularProgressIndicator(),
                        ));
                      } else {
                        return SafeArea(
                          child: ListView(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                child: const CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                              Container(
                                alignment: AlignmentDirectional.center,
                                child: Column(
                                  children: [
                                    Text(
                                      '${userData[0].firstName.toString()} ${userData[0].lastName.toString()}',
                                      style: const TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'Mobile apps Developer',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.email),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.phone),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.message),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            )));
  }
}
