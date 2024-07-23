import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:telemedicine_app/controller/appointcontroller.dart';
import 'package:telemedicine_app/controller/bottomnavcontroller.dart';
import 'package:telemedicine_app/model/appointmodel.dart';
import 'package:telemedicine_app/utils/colorconstant/colorconstant.dart';
import 'package:telemedicine_app/view/appointments/appointments.dart';
import 'package:telemedicine_app/view/bottomnavscreen/bottomnavscreen.dart';

class Detailedscreen extends StatefulWidget {
  const Detailedscreen({
    Key? key,
    required this.index,
    required this.drname,
    required this.specialism,
    required this.image,
  }) : super(key: key);

  final int index;
  final String drname;
  final String specialism;
  final String image;

  @override
  _DetailedscreenState createState() => _DetailedscreenState();
}

class _DetailedscreenState extends State<Detailedscreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  TimeOfDay? _selectedTime;

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorconstant.primarywhite,
        title: Text("Book Appointment"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: colorconstant.primarygreen,
                        backgroundImage: AssetImage(widget.image),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.drname,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(widget.specialism),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: colorconstant.primarygreen,
                              ),
                              Text("Cherpulassery, Palakkad"),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colorconstant.primarygray,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Icon(Icons.people_outline_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "600+",
                            style: TextStyle(
                                color: colorconstant.primarygreen,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Patients"),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 25,
                            width: 1,
                            color: colorconstant.primaryblack,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.people),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "15+",
                            style: TextStyle(
                                color: colorconstant.primarygreen,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Years Exp"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "About",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Dr. ${widget.drname} is a specialist in ${widget.specialism} with over 15 years of experience.",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Select date",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: colorconstant.primarygreen,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Select time",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (_selectedTime == null)
                    ElevatedButton(
                      onPressed: () => _selectTime(context),
                      child: Text('Select Time'),
                    )
                  else
                    Text(
                      "Selected time: ${_selectedTime!.format(context)}",
                      style: TextStyle(fontSize: 16),
                    ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final newAppointment = Appointmodel(
                      drname: widget.drname,
                      specialism: widget.specialism,
                      location: "Cherpulassery, Palakkad",
                      about:
                          "Dr. ${widget.drname} is a specialist in ${widget.specialism} with over 15 years of experience.",
                      date: _selectedDay,
                      time: _selectedTime!,
                      image: widget.image);

                  Provider.of<Appointmentcontroller>(context, listen: false)
                      .addAppointment(newAppointment);

                  Provider.of<Bottomnavcontroller>(context, listen: false)
                      .setIndex(1);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bottomnavscreen(),
                      ),
                      (route) => false);
                },
                child: Text("Make An Appointment"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(colorconstant.primarygreen),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
