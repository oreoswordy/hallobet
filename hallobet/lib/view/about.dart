import 'package:flutter/material.dart';
import 'package:hallobet/utils/apps_color.dart';
import 'package:hallobet/view/widget/widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Tentang Aplikasi"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Center(
                child: Image.asset(
                  "assets/images/poliban.jpg",
                  width: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'OBESTIE',
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 40,
                    color: AppsColor.accentColor,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Selamat datang di OBESTIE, Teman obesitasmu. Aplikasi berbasis mobile yang dikembangkan dengan framework Flutter dengan metode K-Nearest Neighbor. Solusi inovatif yang dirancang untuk mengetahui tingkat obesitas Anda.",
              ),
              const SizedBox(height: 24),
              const Text(
                "Apa yang Kami Tawarkan?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 24),
              const Row(
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
                            fontWeight: FontWeight.bold, fontSize: 16,
                          ),
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
              const SizedBox(height: 12),
              const Row(
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
                            fontWeight: FontWeight.bold, fontSize: 16,
                          ),
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
              const SizedBox(height: 12),
              const Row(
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
                            fontWeight: FontWeight.bold, fontSize: 16,
                          ),
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
              const SizedBox(height: 24),
              const Text(
                "Terima kasih telah memilih OBESTIE. Kami berharap Anda menikmati pengalaman menggunakan aplikasi kami.",
              ),
              const SizedBox(height: 24),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "© 2024 Eliza Putri & Nur Shadrina Apriliany",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
