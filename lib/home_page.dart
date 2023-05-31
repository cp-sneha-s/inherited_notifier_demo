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
        title: Text('InheriteNotifier Demo'),
      ),
      body: ProfileNotifier(
        profileState: state,
        child: Builder(
          builder: (context) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${ProfileNotifier.of(context).name}'),
                  Text('Age: ${ProfileNotifier.of(context).age} Years'),
                  Text('Work: ${ProfileNotifier.of(context).work}')
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
                      ElevatedButton(onPressed: (){
                        Profile profile= Profile(name: _nameController.text,
                            age: _ageController.text,
                            work: _workController.text);
                        state.setProfile(profile);
                        Navigator.pop(context);
                        }, child: Text("Save"))
                    ],
                  );
                });

      }, label: Text('Set Profile')),
    );
  }
}
