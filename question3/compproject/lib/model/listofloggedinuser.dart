import 'package:compproject/model/user.dart';
import 'package:flutter/material.dart';

class LoggedInUser extends ChangeNotifier {
  List<User> loggedInUsers = [];
  void addToUser(User u) {
    loggedInUsers.add(u);
    notifyListeners();
  }
}
