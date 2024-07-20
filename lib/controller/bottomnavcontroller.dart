import 'package:flutter/material.dart';
import 'package:telemedicine_app/view/homescreen/homescreen.dart';
import 'package:telemedicine_app/view/profilescreen/profilescreen.dart';

class Bottomnavcontroller with ChangeNotifier {
  List widgetlist = [Homescreen(), ProfileScreen()];
  int selectedindex = 0;
  Onnavtap(int index) {
    selectedindex = index;

    notifyListeners();
  }
}