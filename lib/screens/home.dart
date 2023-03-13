import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:weatherapp/consts/images.dart';
import 'package:weatherapp/controllers/home_controller.dart';
import 'package:weatherapp/models/current_weather_model.dart';
import '../consts/strings.dart';

// ignore: must_be_immutable
class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  // var controller = Get.put(CurrentWeatherData());

  var date = DateFormat('yMMMMd').format(DateTime.now());
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text = 'Karachi';
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: date.text.color(theme.primaryColor).make(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          // Obx(() {
          //   return IconButton(
          //     onPressed: () {
          //       controller.changeTheme();
          //     },
          //     icon: Icon(
          //       controller.isDark.value ? Icons.light_mode : Icons.dark_mode,
          //       color: theme.iconTheme.color,
          //     ),
          //   );
          // }),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: theme.iconTheme.color,
            ),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      color: Colors.black,
                      onPressed: () {
                        setState(() {});
                      },
                      icon: const Icon(Icons.document_scanner_outlined),
                    )),
              ),
              Expanded(
                child: FutureBuilder(
                    future: getWeather(textEditingController.text),
                    // future: check,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        print('bbbbbbbbbbbbbbbbbbbbbbbbbbb');
                        print(snapshot);
                        // CurrerntWeatherData data = snapshot.data;
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              'data'
                                  .text
                                  .uppercase
                                  .color(theme.primaryColor)
                                  .fontFamily('poppins_bold')
                                  .size(32)
                                  .letterSpacing(2)
                                  .make(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/weather/01d.png',
                                    width: 80,
                                    height: 80,
                                  ),
                                  FittedBox(
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: snapshot.data.main.temp
                                              .toString(),
                                          style: TextStyle(
                                              color: theme.primaryColor,
                                              fontFamily: 'poppin',
                                              fontSize: 45)),
                                      TextSpan(
                                          text: snapshot.data.name.toString(),
                                          style: TextStyle(
                                              color: theme.primaryColor,
                                              letterSpacing: 2,
                                              fontFamily: 'poppin',
                                              fontSize: 14))
                                    ])),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton.icon(
                                      onPressed: null,
                                      icon: Icon(Icons.expand_less_rounded,
                                          color: theme.iconTheme.color),
                                      label: '41$degree'
                                          .text
                                          .color(theme.iconTheme.color)
                                          .make()),
                                  TextButton.icon(
                                      onPressed: null,
                                      icon: Icon(Icons.expand_more_rounded,
                                          color: theme.iconTheme.color),
                                      label: '26$degree'
                                          .text
                                          .color(theme.iconTheme.color)
                                          .make()),
                                ],
                              ),
                              10.heightBox,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(3, (index) {
                                  var iconList = [clouds, humidity, windspeed];
                                  var value = ['70%', '40%', '3.5/km/h'];
                                  return Column(
                                    children: [
                                      Image.asset(
                                        iconList[index].toString(),
                                        width: 60,
                                        height: 60,
                                      )
                                          .box
                                          .gray200
                                          .padding(const EdgeInsets.all(8))
                                          .roundedSM
                                          .make(),
                                      10.heightBox,
                                      value[index].text.gray400.make()
                                    ],
                                  );
                                }),
                              ),
                              10.heightBox,
                              const Divider(),
                              10.heightBox,
                              SizedBox(
                                height: 150,
                                child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: 6,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.all(8),
                                        margin: const EdgeInsets.only(right: 4),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Vx.gray200),
                                        child: Column(
                                          children: [
                                            '${index + 1} AM'.text.make(),
                                            Image.asset(
                                              'assets/weather/09n.png',
                                              width: 80,
                                            ),
                                            '38$degree'.text.make(),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              10.heightBox,
                              const Divider(),
                              10.heightBox,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  'Next 7 Days'
                                      .text
                                      .color(theme.primaryColor)
                                      .semiBold
                                      .size(16)
                                      .make(),
                                  TextButton(
                                      onPressed: () {},
                                      child: 'View All'.text.make())
                                ],
                              ),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 7,
                                  itemBuilder: (context, index) {
                                    var day = DateFormat('EEEE').format(
                                        DateTime.now()
                                            .add(Duration(days: index + 1)));
                                    return Card(
                                      color: theme.cardColor,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: day.text
                                                    .color(theme.primaryColor)
                                                    .semiBold
                                                    .make()),
                                            Expanded(
                                              child: TextButton.icon(
                                                  onPressed: null,
                                                  icon: Image.asset(
                                                      'assets/weather/50n.png',
                                                      width: 40),
                                                  label: '41$degree'
                                                      .text
                                                      .color(theme.primaryColor)
                                                      .make()),
                                            ),
                                            RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                  text: '37$degree /',
                                                  style: TextStyle(
                                                      color: theme.primaryColor,
                                                      fontFamily: 'poppins',
                                                      fontSize: 16)),
                                              TextSpan(
                                                  text: ' 26$degree',
                                                  style: TextStyle(
                                                      color:
                                                          theme.iconTheme.color,
                                                      fontFamily: 'poppins',
                                                      fontSize: 16))
                                            ]))
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                            ],
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          )),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:weatherapp/controllers/home_controller.dart';
// import 'package:weatherapp/models/current_weather_model.dart';
//
// class WeatherApp extends StatefulWidget {
//   const WeatherApp({super.key});
//
//   @override
//   State<WeatherApp> createState() => _WeatherAppState();
// }
//
// class _WeatherAppState extends State<WeatherApp> {
//   // CurrentWeatherData currentWeatherData = CurrentWeatherData();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder(
//             future: getWeather('karachi'),
//             builder: (context, AsyncSnapshot snapshot) {
//               if (snapshot.hasData) {
//                 print('??????????????????????????????????????');
//                 print('${snapshot}');
//                 return Center(
//                     child: Column(
//                   children: [
//                     Text(
//                       snapshot.data.lon,
//                       style: TextStyle(fontSize: 40),
//                     ),
//                     // Text(
//                     //   "${snapshot.data.id}",
//                     //   style: TextStyle(fontSize: 40),
//                     // ),
//                     // Text(
//                     //   "${snapshot.data.email}",
//                     //   style: TextStyle(fontSize: 40),
//                     // ),
//                   ],
//                 ));
//               } else {
//                 return Center(child: CircularProgressIndicator());
//               }
//             }));
//   }
// }
