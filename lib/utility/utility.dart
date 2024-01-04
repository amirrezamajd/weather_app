import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_app/constants/my_colors.dart';
import 'package:weather_app/constants/my_text_style.dart';

class MapString {
  static Widget mapInputToWeather(BuildContext context, String input) {
    String text;
    switch (input) {
      case 'Tornado':
        text = 'Tornado';
        break;
      case 'Thunderstorm':
        text = 'Thunderstorm';
        break;
      case 'Drizzle':
        text = 'Drizzly';
        break;
      case 'Rain':
        text = 'Raining';
        break;
      case 'Snow':
        text = 'Snowing';
        break;
      case 'Mist':
        text = 'Misty';
        break;
      case 'fog':
        text = 'Foggy';
        break;
      case 'Smoke':
        text = 'Smoky';
        break;
      case 'Squall':
        text = 'Squally';
        break;
      case 'Haze':
        text = 'Hazy';
        break;
      case 'Dust':
        text = 'Dusty';
        break;
      case 'Sand':
        text = 'Sandy';
        break;
      case 'Ash':
        text = 'Ashy';
        break;
      case 'Clear':
        text = "Sunny";
        break;
      case 'Clouds':
        text = "Cloudy";
        break;
      default:
        text = "No Info";
    }
    return Text(
      text,
      style: MyTextStyle.inter12,
    );
  }

  static Icon mapStringToIcon(String input, double iconSize) {
    IconData icon;
    switch (input) {
      case 'Thunderstorm':
        icon = MdiIcons.weatherLightningRainy;
        break;
      case 'Drizzle':
        icon = MdiIcons.weatherPartlyRainy;
        break;
      case 'Rain':
        icon = MdiIcons.weatherRainy;
        break;
      case 'Snow':
        icon = MdiIcons.weatherSnowy;
        break;
      case 'Clear':
        icon = MdiIcons.weatherSunny;
        break;
      case 'Clouds':
        icon = MdiIcons.weatherCloudy;
        break;
      case 'Mist':
        icon = MdiIcons.weatherFog;
        break;
      case 'fog':
        icon = MdiIcons.weatherFog;
        break;
      case 'Smoke':
        icon = MdiIcons.smoke;
        break;
      case 'Haze':
        icon = MdiIcons.weatherHazy;
        break;
      case 'Dust':
      case 'Sand':
      case 'Ash':
        icon = MdiIcons.weatherDust;
        break;
      case 'Squall':
      case 'Tornado':
        icon = MdiIcons.weatherTornado;
        break;
      default:
        icon = MdiIcons.weatherCloudy;
    }
    return Icon(icon, size: iconSize, color: MyColors.blueLight80);
  }
}
