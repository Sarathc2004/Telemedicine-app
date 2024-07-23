import 'package:flutter/material.dart';
import 'package:telemedicine_app/database/db.dart';
import 'package:telemedicine_app/utils/colorconstant/colorconstant.dart';
import 'package:telemedicine_app/view/doctorsscreen/doctorsscreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Your Specialist",
          style: TextStyle(color: colorconstant.primarywhite),
        ),
        backgroundColor: colorconstant.primarygreen,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: Database.specialists.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Doctorsscreen(
                        specialist: Database.specialists[index],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: colorconstant.primarygreen,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage(Database.specialistsimages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(Database.specialists[index])
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
