import 'package:flutter/material.dart';
import 'package:hallobet/view/home.dart';
import 'package:hallobet/view/onboarding.dart';
import 'package:hallobet/view_model/view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool wasOnboarding = preferences.getBool("wasOnboarding") ?? false;
  print('wasOnboarding: $wasOnboarding');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CsvViewModel()..initialize(),
        ),
        ChangeNotifierProvider(
          create: (context) => InformationViewModel()..initialize(),
        ),
      ],
      child: MainApp(
        wasOnboarding: wasOnboarding,
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  final bool wasOnboarding;

  const MainApp({super.key, required this.wasOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      initialRoute: wasOnboarding ? '/' : '/onboarding',
      routes: {
        '/': (context) => const HomeScreen(),
        '/onboarding': (context) => const OnBoardingScreen(),
      },
    );
  }
}
