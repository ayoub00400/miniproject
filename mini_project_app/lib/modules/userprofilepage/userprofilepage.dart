import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:mini_project_app/models/usermodel.dart';
import 'package:mini_project_app/modules/userprofilepage/cubit/userprofile_cubit.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<UserModel> userData =
        ModalRoute.of(context)!.settings.arguments as List<UserModel>;
    return BlocProvider(
        create: (context) => UserprofileCubit(),
        child: Scaffold(
            appBar: AppBar(
              title:  Text(AppLocalizations.of(context)!.profiletxt),
            ),
            body: BlocBuilder<UserprofileCubit, UserprofileState>(
              builder: (context, state) {
                return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<UserprofileCubit>(context)
                        .getUserById(userData[0].userId);
                  },
                  child: BlocBuilder<UserprofileCubit, UserprofileState>(
                    builder: (context, state) {
                      if (state is LoadingUserPageLoading) {
                        return SafeArea(
                            child: Center(
                          child: CircleAvatar(),
                        ));
                      } else
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
                                      "${userData[0].userFullName['firstname'].toString()} ${userData[0].userFullName['lastname'].toString()}",
                                      style: TextStyle(
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
                    },
                  ),
                );
              },
            )));
  }
}
