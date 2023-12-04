import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/wether_provider.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: Builder(builder: (context) {
        var weatherCondition =
            Provider.of<WeatherProvider>(context).weatherModel?.condition;
        var themeColor = Provider.of<WeatherProvider>(context)
            .getThemeColor(weatherCondition);

        return MaterialApp(
          theme: ThemeData(
            primarySwatch: themeColor,
          ),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        );
      }),
    );
  }
}
