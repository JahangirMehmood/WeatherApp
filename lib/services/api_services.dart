// import '../consts/strings.dart';
// import 'package:http/http.dart' as http;
//
// import '../models/current_weather_model.dart';
// import '../models/hourly_weather_model.dart';
//
// getCurrentWeather() async {
//   var link =
//       "https://api.openweathermap.org/data/2.5/weather?q=karachi&appid=06bcd1a0218c717e9cf87a544392a6a1";
//   // "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=$apiKey&units=metric";
//   print(link);
//   var res = await http.get(Uri.parse(link));
//   print('fffffffffffffffffffffffffffffffff');
//   print(res);
//   if (res.statusCode == 200) {
//     var data = CurrentWeatherData(res.body.toString());
//     print('fffffffffffffffffffffffffffffffff');
//     print(data);
//
//     return data;
//   }
// }
//
// getHourlyWeather(lat, long) async {
//   var link =
//       "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=$apiKey&units=metric";
//   var res = await http.get(Uri.parse(link));
//   if (res.statusCode == 200) {
//     var data = hourlyWeatherDataFromJson(res.body.toString());
//
//     return data;
//   }
// }
