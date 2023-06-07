import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inherited_notifier_demo/profile.dart';
import 'package:inherited_notifier_demo/profile_notifier.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _hobbyController = TextEditingController();

  final UserState userState = UserState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedNotifier Demo'),
      ),
      body: Center(
        child: UserStateNotifier(
          userState: userState,
          child: Builder(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Name : ${UserStateNotifier.of(context).name}',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  'Age : ${UserStateNotifier.of(context).age}',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  'Hobby : ${UserStateNotifier.of(context).hobby}',
                  style: const TextStyle(fontSize: 20),
                )
              ],
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            hintText: 'Enter you name here',
                            border: OutlineInputBorder()),
                      ),
                      TextField(
                        controller: _ageController,
                        decoration: const InputDecoration(
                          hintText: 'Enter you age here',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: _hobbyController,
                        decoration: const InputDecoration(
                            hintText: 'Enter you hobby here',
                            border: OutlineInputBorder()),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            User user = User(
                                name: _nameController.text,
                                age: _ageController.text,
                                hobby: _hobbyController.text);
                            userState.setProfile(user);
                            Navigator.pop(context);
                          },
                          child: const Text("Save"))
                    ],
                  );
                });
          },
          label: const Text('Set Profile')),
    );
  }
}
