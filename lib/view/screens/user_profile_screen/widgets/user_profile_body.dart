import 'package:flutter/material.dart';

import '../../../../models/user.dart';

class UserProfileBody extends StatelessWidget {
  final User userData;
  const UserProfileBody({super.key, required this.userData});
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
