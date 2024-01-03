import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/my_colors.dart';
import 'package:weather_app/constants/my_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffD0EFFC), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(
                  width: 16,
                  height: 16,
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  )),
              Expanded(
                child: TextField(
                  cursorColor: MyColors.blueLight80,
                  style: MyTextStyle.inter12,
                  decoration: InputDecoration(
                      hintText: 'fdg',
                      hintStyle: MyTextStyle.inter12,
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 24)),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
