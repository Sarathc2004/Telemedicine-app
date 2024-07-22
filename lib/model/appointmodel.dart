import 'package:flutter/material.dart';

class Appointmodel {
  final String image;
  final String drname;
  final String specialism;
  final String location;
  final String about;
  final DateTime date;
  final TimeOfDay time;

  Appointmodel({
    required this.image,
    required this.drname,
    required this.specialism,
    required this.location,
    required this.about,
    required this.date,
    required this.time,
  });

  @override
  String toString() {
    return 'Appointmodel(drname: $drname, specialism: $specialism, location: $location, about: $about, date: $date, time: ${time})';
  }
}
