// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profilecontroller with ChangeNotifier {
  void notificationbutton() {
    print("Notification");
  }

  void settingsbutton() {
    print("Settings");
  }

  void helpbutton() {
    print("Help");
  }

  void logoutbutton() async {
    await FirebaseAuth.instance.signOut();

    notifyListeners();
  }
}
