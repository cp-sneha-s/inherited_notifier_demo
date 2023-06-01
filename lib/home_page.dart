import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inherited_notifier_demo/profile.dart';
import 'package:inherited_notifier_demo/profile_notifier.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  UserState userState = UserState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedNotifier Demo'),
      ),
      body: Center(
        child: UserStateNotifier(
          userState: userState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Name : ${UserStateNotifier.of(context).name}',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Age : ${UserStateNotifier.of(context).name}',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Hobby : ${UserStateNotifier.of(context).name}',
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: const Text('Set Profile')),
    );
  }
}
