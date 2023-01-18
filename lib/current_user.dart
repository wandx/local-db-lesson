import 'package:local_db_lesson/models/user.dart';

class CurrentUser {
  CurrentUser._();

  static final CurrentUser _instance = CurrentUser._();

  static CurrentUser get instance => _instance;

  User? _user;

  User? get user => _user;

  void setUser(User u) {
    _user = u;
  }
}
