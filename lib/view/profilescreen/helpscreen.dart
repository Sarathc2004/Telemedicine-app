// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:telemedicine_app/utils/colorconstant/colorconstant.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget Heading(String title) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget subtitle(String title) {
      return ListTile(
        title: Text(title),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {},
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorconstant.primarygreen,
        title: Text('Help & Support'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Heading('Getting Started'),
          subtitle('How to Register'),
          subtitle('Logging In'),
          Heading('Using the App'),
          subtitle('Home Screen Overview'),
          subtitle('Booking an Appointment'),
          subtitle('Joining a Zoom Meeting'),
          Heading('Account Management'),
          subtitle('Updating Profile'),
          subtitle('Changing Password'),
          subtitle('Deleting Account'),
          Heading('Technical Support'),
          subtitle('Common Issues'),
          subtitle('Contact Support'),
          Heading('FAQs'),
          subtitle('Frequently Asked Questions'),
          Heading('Privacy and Security'),
          subtitle('Privacy Policy'),
          subtitle('Terms of Service'),
        ],
      ),
    );
  }
}
