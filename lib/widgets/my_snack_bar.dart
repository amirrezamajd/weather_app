import 'package:flutter/material.dart';
import 'package:weather_app/constants/my_text_style.dart';

SnackBar mySnackBar(String title, BuildContext context) => SnackBar(
      content: Text(
        title,
        style: MyTextStyle.inter12,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.black,
      elevation: 0,
      duration: const Duration(seconds: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(15),
    );
