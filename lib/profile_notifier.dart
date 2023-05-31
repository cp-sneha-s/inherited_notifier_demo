import 'package:flutter/cupertino.dart';
import 'package:inherited_notifier_demo/profile.dart';

class ProfileState with ChangeNotifier {

  Profile? _profile;

  void setProfile(Profile updatedProfile) {
    _profile = updatedProfile;
    notifyListeners();
  }

  Profile get profile => _profile??Profile(name: 'Ninja', age: '28', work: 'InfoTech');
}

class ProfileNotifier extends InheritedNotifier<ProfileState> {
  const ProfileNotifier(
      {super.key, required ProfileState profileState, required Widget child})
      : super(notifier: profileState, child: child);

  static Profile of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ProfileNotifier>()!
        .notifier!
        .profile;
  }

  @override
  bool updateShouldNotify(covariant InheritedNotifier<ProfileState> oldWidget) {
    return notifier!.profile != oldWidget.notifier!.profile;
  }
}
