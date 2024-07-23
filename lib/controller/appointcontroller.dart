import 'package:flutter/material.dart';
import 'package:telemedicine_app/model/appointmodel.dart';

class Appointmentcontroller with ChangeNotifier {
  List<Appointmodel> _appointments = [];

  List<Appointmodel> get appointments => _appointments;

  void addAppointment(Appointmodel appointment) {
    _appointments.add(appointment);
    notifyListeners();
  }
}
