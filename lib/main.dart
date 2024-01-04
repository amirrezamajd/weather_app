import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/constants/my_colors.dart';
import 'package:weather_app/constants/my_text_style.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/di/di.dart';
import 'package:weather_app/screens/splash_screen.dart';

void main() async {
  await getItInit();
  await Hive.initFlutter();
  Hive.registerAdapter(WeatherModelAdapter());
  await Hive.openBox<WeatherModel>('WeatherBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
