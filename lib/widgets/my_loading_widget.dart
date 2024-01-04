import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/constants/my_colors.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitThreeBounce(color: MyColors.blueLight80, size: 20);
  }
}
