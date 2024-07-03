
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  String _cityName = 'London'; // Default city

  void _fetchWeather() async {
    try {
      Weather weather = await _weatherService.getWeather(_cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print('Error fetching weather: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: _weather == null
            ? CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _weather!.cityName,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '${_weather!.temperature.toStringAsFixed(1)} °C',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              _weather!.description,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Image.network(
              'http://openweathermap.org/img/w/${_weather!.iconCode}.png',
              scale: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}