import 'package:flutter/material.dart';
import 'package:telemedicine_app/model/appointmodel.dart';

class Appointmentcontroller with ChangeNotifier {
  List<Appointmodel> _appointments = [
    // Appointmodel(
    //   image: "",
    //   drname: "aa",
    //   specialism: "ff",
    //   location: "vg",
    //   about: "nznxx x",
    //   date: DateTime(2024, 1, 10),
    //   time: TimeOfDay(hour: 11, minute: 30),
    // ),
  ];

  List<Appointmodel> get appointments => _appointments;

  void addAppointment(Appointmodel appointment) {
    _appointments.add(appointment);
    notifyListeners();
  }
}
