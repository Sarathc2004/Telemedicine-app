import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemedicine_app/controller/appointcontroller.dart';
import 'package:telemedicine_app/controller/authcontroller.dart';
import 'package:telemedicine_app/model/appointmodel.dart';
import 'package:telemedicine_app/utils/colorconstant/colorconstant.dart';
import 'package:telemedicine_app/view/registerloginscreen/registerscreen.dart';

class Appointments extends StatelessWidget {
  Appointments({Key? key}) : super(key: key);
  final Authmethods authmethods = Authmethods();

  void showBottomSheet(BuildContext context, Appointmodel appointment) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(appointment.image),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appointment.drname,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(appointment.specialism),
                          SizedBox(height: 10),
                          Text(
                              '${appointment.date.day}-${appointment.date.month}-${appointment.date.year} ${appointment.time.format(context)}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Location: Cherpulassery, Palakkad",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "About: Dr. ${appointment.drname} is a specialist in ${appointment.specialism} with over 15 years of experience.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Confirm Appointment"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(colorconstant.primarygreen),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: colorconstant.primarygreen,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: colorconstant.primarywhite,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterScreen(),
            ),
            (route) => false,
          );
        },
        child: Icon(Icons.logout),
        backgroundColor: colorconstant.primarygreen,
      ),
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: colorconstant.primarywhite),
        ),
        backgroundColor: colorconstant.primarygreen,
      ),
      body: Center(
        child: Consumer<Appointmentcontroller>(
          builder: (context, appointmentController, child) {
            return ListView.builder(
              itemCount: appointmentController.appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointmentController.appointments[index];
                return GestureDetector(
                  onTap: () => showBottomSheet(context, appointment),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(color: colorconstant.primarygreen)),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(appointment.image,
                                width: 60, height: 70, fit: BoxFit.cover),
                          ),
                          SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(appointment.drname,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text(appointment.specialism),
                              Text(
                                '${appointment.date.day}-${appointment.date.month}-${appointment.date.year} ${appointment.time.format(context)}',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
