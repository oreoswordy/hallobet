import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailInformation extends StatelessWidget {
  String title;
  String image;
  String desc;
  DetailInformation({
    super.key,
    required this.title,
    required this.image,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OBESTIE"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://media.istockphoto.com/id/1314797892/id/foto/obesitas-berat-badan-tidak-sehat-ahli-gizi-memeriksa-pinggang-wanita-menggunakan-pita-meter.jpg?s=612x612&w=0&k=20&c=ydZ4-lwelbRe7twM2KOyIa_qnSf85kiSrQ5Z53dLfYI="),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                """
                $desc
                """,
                style: GoogleFonts.openSans(
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
