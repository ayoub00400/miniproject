import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_project_app/view/screens/user_profile_page/user_profile_provider.dart';

import '../../../models/user.dart';

class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User userData = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.profileTxt),
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              print(ref.watch(userProvider.notifier).state);

              var newState =
                  await ref.refresh(userFutureProvider.call(userData.userId));

              print(newState);
              ref
                  .watch(userProvider.notifier)
                  .update((state) => state = newState.value);
            },
            child: SafeArea(
                child: (ref.read(userProvider.notifier).state == null)
                    ? ListView(
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
                                  '${userData.firstName.toString()} ${userData.lastName.toString()}',
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      )
                    : ref.watch(userFutureProvider(userData.userId)).when(
                        data: (data) {
                          if (ref
                              .watch(userFutureProvider(userData.userId))
                              .isLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView(
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
                                      '${data!.firstName.toString()} ${data.lastName.toString()}',
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
                      ))));
  }
}
