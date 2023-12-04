import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/wether_provider.dart';

class WeatherInfoScreen extends StatelessWidget {
  const WeatherInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weatherModelProvider =
        Provider.of<WeatherProvider>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Provider.of<WeatherProvider>(context)
            .getThemeColor(weatherModelProvider?.condition),
        Provider.of<WeatherProvider>(context)
            .getThemeColor(weatherModelProvider?.condition)[300]!,
        Provider.of<WeatherProvider>(context)
            .getThemeColor(weatherModelProvider?.condition)[50]!,
      ], begin: Alignment.centerLeft, end: Alignment.bottomRight)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModelProvider!.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              weatherModelProvider.date,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  fit: BoxFit.cover,
                  'https:${weatherModelProvider.image}',
                ),
                Text(
                  weatherModelProvider.temp.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp:${weatherModelProvider.maxTemp} ',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherModelProvider.minTemp}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModelProvider.condition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
