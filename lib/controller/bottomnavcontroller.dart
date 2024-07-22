import 'package:flutter/material.dart';
import 'package:telemedicine_app/view/appointments/appointments.dart';
import 'package:telemedicine_app/view/homescreen/homescreen.dart';

class Bottomnavcontroller with ChangeNotifier {
  List widgetlist = [Homescreen(), Appointments()];
  int selectedindex = 0;
  Onnavtap(int index) {
    selectedindex = index;

    notifyListeners();
  }
}
