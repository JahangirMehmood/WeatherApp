// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../services/api_services.dart';
//
// class HomeController extends GetxController {
//   @override
//   void oninit() {
//     currentWeatherData = getCurrentWeather();
//     print(getCurrentWeather());
//     print('ccccccccccccccccccccccccccccccccccccccccc');
//     print(currentWeatherData);
//     super.onInit();
//   }
//
//   var isDark = false.obs;
//   var currentWeatherData;
//   changeTheme() {
//     isDark.value = !isDark.value;
//     Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/models/current_weather_model.dart';

getWeather(name) async {
  // final String countryName = name == null && name!.isEmpty ? 'karachi' : name;
  var baseUrl =
      "https://api.openweathermap.org/data/2.5/weather?q=$name,{country%20code}&appid=06bcd1a0218c717e9cf87a544392a6a1";
  var url = Uri.parse(baseUrl);
  var res = await http.get(url);
  // print('kkkkkkkkkkkkkkkkkkkk');
  // print(res.body);
  var jsonRes = jsonDecode(res.body);
  // print('ggggggggggggggggggggggggggggggg');
  // print(jsonRes);
  return CurrentWeatherData.fromJson(jsonRes);
}
