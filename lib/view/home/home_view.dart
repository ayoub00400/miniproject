import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../user_profile/user_profile_view.dart';
import '../../../view_models/home_veiw_model.dart';

import 'widgets/user_card.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var langDelegate = AppLocalizations.of(context)!;
    var users = ref.watch(homeFutureProvider);

    return Scaffold(
      appBar: AppBar(title: Text(langDelegate.homePageTitle)),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: RefreshIndicator(
            // onRefresh: () async {
            //   var newState = await ref.refresh(homeFutureProvider.future);

            //   ref
            //       .watch(homeStateProvider.notifier)
            //       .update((state) => state = newState);
            // },
            onRefresh: () => ref.refresh(homeFutureProvider.future),
            child: users.when(
              data: (data) {
                if (users.isRefreshing) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (data.isEmpty) {
                  return ListView(
                    children: const [
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
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return UserCard(
                        userData: data[index],
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserProfileView(userId: data[index].userId),
                              settings: RouteSettings(arguments: data[index]),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
              error: (error, stackTrace) {
                if (users.isRefreshing) {
                  return const Center(child: CircularProgressIndicator());
                }
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
              loading: () {
                return ListView(
                  children: const [
                    SizedBox(
                      height: 300,
                    ),
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
