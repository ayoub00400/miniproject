import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_profile_provider.dart';

class UserProfilePage extends ConsumerWidget {
  final int userId;
  const UserProfilePage({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userData = ref.watch(userFutureProvider(userId));
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profileTxt),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return ref.refresh(userFutureProvider.call(userId));
        },
        child: SafeArea(
          child: userData.when(
            data: (data) {
              if (userData.isRefreshing) {
                return const Center(
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
                          '${data!.firstName} ${data.lastName}',
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
              );
            },
            loading: () {
              if (userData.isRefreshing) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: const [
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
                  const SizedBox(
                    height: 200,
                  ),
                  Center(
                    child: Text(error.toString()),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
