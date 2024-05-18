import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:hallobet/view/about.dart';
import 'package:hallobet/view/consultation.dart';
import 'package:hallobet/view/csv.dart';
import 'package:hallobet/view/information.dart';
import 'package:hallobet/view/widget/widget.dart';
import 'package:hallobet/view_model/view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "OBESTIE",
              style: GoogleFonts.righteous(
                textStyle: const TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            const SizedBox(height: 3),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<InformationViewModel>(
                builder: (context, viewModel, child) {
                  return CarouselSlider(
                    items: viewModel.items.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://media.istockphoto.com/id/1314797892/id/foto/obesitas-berat-badan-tidak-sehat-ahli-gizi-memeriksa-pinggang-wanita-menggunakan-pita-meter.jpg?s=612x612&w=0&k=20&c=ydZ4-lwelbRe7twM2KOyIa_qnSf85kiSrQ5Z53dLfYI="), // Use data from JSON
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title, // Use data from JSON
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        item.description, // Use data from JSON
                                        maxLines: 3,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.openSans(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      autoPlay: true,
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Menu",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        cardMenu(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const InformationScreen(),
                            ),
                          );
                        }, "https://cdn-icons-png.flaticon.com/512/9340/9340025.png",
                            "Informasi Kesehatan"),
                        cardMenu(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ConsultationScreen(),
                            ),
                          );
                        }, "https://cdn-icons-png.flaticon.com/512/4850/4850909.png",
                            "Konsultasi"),
                        cardMenu(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutScreen(),
                            ),
                          );
                        }, "https://cdn.icon-icons.com/icons2/2299/PNG/512/giving_medical_help_care_healthcare_hand_wash_icon_141641.png",
                            "Tentang Aplikasi"),
                        cardMenu(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CsvScreen(),
                            ),
                          );
                        }, "https://cdn.icon-icons.com/icons2/2299/PNG/512/giving_medical_help_care_healthcare_hand_wash_icon_141641.png",
                            "Tentang Aplikasi"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
