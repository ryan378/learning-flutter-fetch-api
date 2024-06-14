import 'package:feed_app/user-list/model/user.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CircleAvatar(
                radius: 32,
                child: Text(
                  user.title,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  user.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Center(
              child: Text(
                user.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
