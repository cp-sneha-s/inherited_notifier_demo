import 'package:flutter/cupertino.dart';
import 'package:inherited_notifier_demo/profile.dart';

class UserState with ChangeNotifier {
  User _user = User();

  void setProfile(User updatedProfile) {
    _user = updatedProfile;
    notifyListeners();
  }

  User get user => _user;
}

class UserStateNotifier extends InheritedNotifier<UserState> {
  const UserStateNotifier(
      {super.key, required UserState userState, required super.child})
      : super(notifier: userState);

  static User of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<UserStateNotifier>()!
        .notifier!
        .user;
  }

  @override
  bool updateShouldNotify(covariant InheritedNotifier<UserState> oldWidget) {
    return notifier!.user != oldWidget.notifier!.user;
  }
}
