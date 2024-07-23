// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemedicine_app/controller/bottomnavcontroller.dart';
import 'package:telemedicine_app/utils/colorconstant/colorconstant.dart';

class Bottomnavscreen extends StatefulWidget {
  Bottomnavscreen({super.key});

  @override
  State<Bottomnavscreen> createState() => _userbottomnavscreenState();
}

class _userbottomnavscreenState extends State<Bottomnavscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Consumer<Bottomnavcontroller>(
        builder: (context, navcontroller, child) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                label: 'Appointments',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: navcontroller.selectedindex,
            selectedItemColor: colorconstant.primarygreen,
            onTap: (value) {
              navcontroller.Onnavtap(value);
            },
          );
        },
      ),
      body: Consumer<Bottomnavcontroller>(
        builder: (context, navcontroller, child) {
          return navcontroller.widgetlist[navcontroller.selectedindex];
        },
      ),
    ));
  }
}
