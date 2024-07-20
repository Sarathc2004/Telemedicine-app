// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemedicine_app/controller/bottomnavcontroller.dart';
import 'package:telemedicine_app/view/splashscreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCw3l3SnoTcmWMv9f0t1CqlqoRN69Jonxc",
          appId: "1:227850607696:android:90a45639907e2d66e14555",
          messagingSenderId: "",
          projectId: "telemedicine-app-e2734",
          storageBucket: "telemedicine-app-e2734.appspot.com"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Bottomnavcontroller(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}
