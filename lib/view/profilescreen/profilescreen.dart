import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemedicine_app/controller/authcontroller.dart';
import 'package:telemedicine_app/utils/colorconstant/colorconstant.dart';
import 'package:telemedicine_app/view/registerloginscreen/registerscreen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final Authmethods authmethods = Authmethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: colorconstant.primarywhite),
        ),
        backgroundColor: colorconstant.primarygreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: colorconstant.primarygreen,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sarath C',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Sarathc@gmail.com'),
            SizedBox(height: 20),
            ElevatedButton(
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
              child: Text('Logout'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(colorconstant.primarygreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
