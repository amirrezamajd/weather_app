import 'package:flutter/material.dart';
import 'package:weather_app/constants/my_colors.dart';
import 'package:weather_app/constants/my_text_style.dart';
import 'package:weather_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(bodyMedium: MyTextStyle.inter12),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          background: MyColors.bg,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
