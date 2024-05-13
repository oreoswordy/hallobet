import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hallobet/presentation/about.dart';
import 'package:hallobet/presentation/consultation.dart';
import 'package:hallobet/presentation/information.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(
                "OBESTIE",
                style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.indigo, letterSpacing: .5),
  ),
              ),
              Text(
                "welcome",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              ),],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(height: 24),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InformationScreen(),));
                    },
                    child: Card(
                      child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network("https://cdn-icons-png.flaticon.com/512/9340/9340025.png", height: 75,),
                         
                          SizedBox(height: 12),
                          Text("Informasi Kesehatan"),
                        ],
                      ),
                    ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ConsultationScreen(),));
                    },
                    child: Card(
                      child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network("https://cdn-icons-png.flaticon.com/512/4850/4850909.png", height: 75,),
                          SizedBox(height: 12),
                          Text("Konsultasi"),
                        ],
                      ),
                    ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen(),));
                    },
                    child: Container(
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Image.network("https://cdn.icon-icons.com/icons2/2299/PNG/512/giving_medical_help_care_healthcare_hand_wash_icon_141641.png", height: 75,),
                            SizedBox(height: 12),
                            Text("Tentang Aplikasi"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
