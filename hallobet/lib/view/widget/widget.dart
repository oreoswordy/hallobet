import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hallobet/utils/apps_color.dart';

Widget textFieldConsultation(String hint, TextEditingController controller) {
  return TextField(
    keyboardType: TextInputType.number,
    controller: controller,
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

Widget cardInformation(Function()? func, BuildContext context, String image,
    String title, String desc) {
  return Container(
    margin: const EdgeInsets.all(12),
    child: GestureDetector(
      onTap: func,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppsColor.secondaryColor,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    desc,
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                    ),
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

AppBar appBarWidget(String title) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    scrolledUnderElevation: 0,
    title: Text(
      title,
    ),
  );
}

Widget titleConsultation(String title) {
  return Text(title, style: const TextStyle(fontSize: 18));
}

Widget textfieldNumber(String title, TextEditingController controller) {
  return Text(title, style: const TextStyle(fontSize: 18));
}

Widget cardMenu(Function()? func, String image, String title) {
  return GestureDetector(
    onTap: func,
    child: Container(
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              height: 125,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppsColor.secondAccentColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12), // Add padding to shrink the image
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget cardInfromation(
    BuildContext context, String image, String title, String desc) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    child: Card(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://media.istockphoto.com/id/1314797892/id/foto/obesitas-berat-badan-tidak-sehat-ahli-gizi-memeriksa-pinggang-wanita-menggunakan-pita-meter.jpg?s=612x612&w=0&k=20&c=ydZ4-lwelbRe7twM2KOyIa_qnSf85kiSrQ5Z53dLfYI="), // Ensure imageUrl exists in your model
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  desc,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget imageError() {
  return Container(
    color: Colors.grey[300],
    child: const Center(
      child: Text(
        "Gambar Tidak Tersedia",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget tagText(String tag) {
  return Text(
    tag,
    style: TextStyle(fontSize: 16, color: Colors.grey),
  );
}

AppBar appsBar() {
  return AppBar(
    centerTitle: true,
    title: const Text(
      'HALLOBET',
      style: TextStyle(
          fontFamily: 'Gotham', fontSize: 18, color: AppsColor.accentColor),
    ),
  );
}
