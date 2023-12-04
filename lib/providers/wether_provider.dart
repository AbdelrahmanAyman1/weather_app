import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/weather_model.dart';
import '../services/weather_services.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    weatherModel =
        await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
    notifyListeners();
  }

  MaterialColor getThemeColor(String? condition) {
    if (condition == null) {
      return Colors.blue;
    }
    notifyListeners();
    switch (condition) {
      case "Sunny":
      case "Partly cloudy":
      case "Blowing snow":
      case "Blizzard":
        return Colors.orange;
      case "Cloudy":
      case "Overcast":
      case "Mist":
      case "Fog":
      case "Freezing fog":
        return Colors.grey;
      case "Patchy rain possible":
      case "Patchy snow possible":
      case "Patchy sleet possible":
      case "Patchy freezing drizzle possible":
      case "Thundery outbreaks possible":
      case "Patchy light drizzle":
      case "Light drizzle":
      case "Patchy light rain":
      case "Light rain":
      case "Moderate rain at times":
      case "Moderate rain":
      case "Patchy light snow":
      case "Light snow":
      case "Patchy moderate snow":
      case "Moderate snow":
      case "Patchy heavy snow":
      case "Heavy snow":
      case "Light rain shower":
      case "Moderate or heavy rain shower":
      case "Torrential rain shower":
      case "Light sleet showers":
      case "Moderate or heavy sleet showers":
      case "Light snow showers":
      case "Moderate or heavy snow showers":
      case "Light showers of ice pellets":
      case "Moderate or heavy showers of ice pellets":
      case "Patchy light rain with thunder":
      case "Moderate or heavy rain with thunder":
      case "Patchy light snow with thunder":
      case "Moderate or heavy snow with thunder":
        return Colors.blueGrey;
      case "Light freezing rain":
      case "Moderate or heavy freezing rain":
      case "Light sleet":
      case "Moderate or heavy sleet":
      case "Ice pellets":
        return Colors.lightBlue;

      default:
        return Colors.blue;
    }
  }
}
