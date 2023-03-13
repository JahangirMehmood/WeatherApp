import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/weather_controller.dart';
import 'package:weatherapp/weather_controller.dart';
import 'package:weatherapp/weather_controller.dart';
import 'package:weatherapp/weather_model.dart';
import 'package:weatherapp/weather_controller.dart';

import 'weather_controller.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WEATHER APP'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {},
            child: Text(
              'Search',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
