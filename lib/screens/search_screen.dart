import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wether_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor:
            provider.getThemeColor(provider.weatherModel?.condition),
        title: const Text(
          'Search city',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onSubmitted: (value) async {
              provider.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                    color: provider
                        .getThemeColor(provider.weatherModel?.condition)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                    color: provider
                        .getThemeColor(provider.weatherModel?.condition)),
              ),
              hintText: 'Enter city name',
              suffixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.all(28),
              label: Text('search',
                  style: TextStyle(
                      color: provider
                          .getThemeColor(provider.weatherModel?.condition))),
            ),
          ),
        ),
      ),
    );
  }
}
