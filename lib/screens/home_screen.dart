import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/no_weather_body.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/weather_info_screen.dart';

import '../providers/wether_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        backgroundColor:
            provider.getThemeColor(provider.weatherModel?.condition),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
        title: const Text(
          'Weather app',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: provider.getWeather(cityName: ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.weatherModel == null) {
            return const NoWeatherBody(); // Show NoWeatherBody on error or if weatherModel is null
          } else {
            return const WeatherInfoScreen(); // Show WeatherInfoScreen when data is available
          }
        },
      ),
    );
  }
}
