import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hallobet/utils/apps_color.dart';
import 'package:hallobet/view/widget/widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Tentang Aplikasi"),
      body: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'OBESTIE',
                style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 48,
                    color: AppsColor.accentColor),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Selamat datang di OBESTIE, Teman obesitasmu. Aplikasi berbasis mobile yang dikembangkan dengan framework Flutter dengan metode K-Nearest Neighbor. Solusi inovatif yang dirancang untuk mengetahui tingkat obesitas Anda.",
            ),
            SizedBox(height: 24),
            Text(
              "Apa yang Kami Tawarkan?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("1. ", style: TextStyle(fontSize: 16)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kemudahan mengakses informasi kesehatan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "Pengguna dapat melihat beberapa informasi seputar obesitas.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("2. ", style: TextStyle(fontSize: 16)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fitur yang disediakan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "Nikmati berbagai fitur yang dirancang untuk memudahkan hidup Anda, mulai dari Konsultasi hingga Informasi Kesehatan.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("3. ", style: TextStyle(fontSize: 16)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Support 24/7",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "Kami siap membantu Anda kapan saja, di mana saja.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
                "Terima kasih telah memilih OBESTIE. Kami berharap Anda menikmati pengalaman menggunakan aplikasi kami."),
          ],
        ),
      ),
    );
  }
}
