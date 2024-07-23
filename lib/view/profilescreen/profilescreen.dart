import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemedicine_app/controller/profilecontroller.dart';
import 'package:telemedicine_app/database/db.dart';
import 'package:telemedicine_app/utils/colorconstant/colorconstant.dart';
import 'package:telemedicine_app/view/registerloginscreen/registerscreen.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Positioned(
                child: Container(
                  height: 150,
                  color: colorconstant.primarygreen,
                ),
              ),
              Positioned(
                  top: 10,
                  left: 145,
                  child: CircleAvatar(
                    radius: 50,
                  )),
              Positioned(
                  left: 161,
                  bottom: 5,
                  child: Text(
                    "Sarath.c",
                    style: TextStyle(fontSize: 20),
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 600,
                  decoration: BoxDecoration(
                    color: colorconstant.primarywhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Database.profilelist.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: InkWell(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  print("Notificatios");
                                  break;
                                case 1:
                                  print("Settings");
                                  break;
                                case 2:
                                  print("Help");
                                  break;
                                case 3:
                                  Provider.of<Profilecontroller>(context,
                                          listen: false)
                                      .logoutbutton();

                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterScreen(),
                                      ),
                                      (route) => false);

                                default:
                                  break;
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: 50,
                              decoration: BoxDecoration(
                                color: colorconstant.primarywhite,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Database.profilelist[index]["icon"]),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(Database.profilelist[index]
                                          ["buttonname"]),
                                    ],
                                  ),
                                  Row(
                                    children: [Icon(Icons.arrow_forward)],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
