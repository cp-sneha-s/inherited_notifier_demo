import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inherited_notifier_demo/profile.dart';
import 'package:inherited_notifier_demo/profile_notifier.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
   final TextEditingController _ageController = TextEditingController();

   final TextEditingController _workController = TextEditingController();
   ProfileState state =ProfileState();


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedNotifier Demo'),
      ),
      body: ProfileNotifier(
        profileState: state,
        child: Builder(
          builder: (context) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Name : ${ProfileNotifier.of(context).name}',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  'Age : ${ProfileNotifier.of(context).age} ',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  'Hobby : ${ProfileNotifier.of(context).work}',
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
                showModalBottomSheet(context: context, builder: (_){
                  return Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter you name here',
                          border: OutlineInputBorder()
                        ),
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
                        controller: _workController,
                        decoration: const InputDecoration(
                            hintText: 'Enter you work here',
                            border: OutlineInputBorder()
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Profile profile = Profile(
                                name: _nameController.text,
                                age: _ageController.text,
                                work: _workController.text);
                            state.setProfile(profile);
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
