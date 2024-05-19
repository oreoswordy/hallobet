import 'package:flutter/material.dart';

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

Widget cardInformation(Function()? func,
    BuildContext context, String image, String title, String desc) {
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
              height: MediaQuery.of(context).size.height * 0.15,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber,
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
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    desc,
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
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
    backgroundColor: const Color(0xff874CCC),
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(color: Colors.white),
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
    child: Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              image,
              height: 75,
            ),
            const SizedBox(height: 12),
            Text(title),
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
