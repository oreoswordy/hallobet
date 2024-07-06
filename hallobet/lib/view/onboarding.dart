import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hallobet/utils/apps_color.dart';
import 'package:hallobet/view/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/image/onboarding.png")),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/image/onboard.png"),
            ),
            const SizedBox(height: 24),
            Text(
              textAlign: TextAlign.center,
              'Selamat Datang di Obestie!',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              textAlign: TextAlign.center,
              'Teman obesitasmu yang akan membantumu mengatur pola makan dan olahraga agar tetap sehat dan bugar!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 48),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  await preferences.setBool('wasOnboarding', true);

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                    (route) => false,
                  );
                },
                child: const Text(
                  'Mulai Sekarang',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppsColor.accentColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
