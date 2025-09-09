// import 'dart:ui';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'card.dart';
import 'package:flutter/material.dart';
import './bottom_ui.dart';
import './hourly_data.dart';
import './api_call.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final Api_data api = Api_data(); // ✅ keep one instance
  late Future<Map<String, dynamic>> futureWeather;
  String city_name = 'Hyderabad';
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String formattedTime = DateFormat('HH:mm').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    futureWeather = api.Find();
  }

  void _searchCity(String cityName) {
    setState(() {
      formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      formattedTime = DateFormat('HH:mm').format(DateTime.now());
      city_name = cityName;
      api.naming(cityName);
      futureWeather = api.Find();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Weather App',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                futureWeather = api.Find(); // refresh button
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          var data = snapshot.data!;
          final c_temp = data['list'][0]['main']['temp'] - 273.15;
          final curr_text = data['list'][0]['weather'][0]['main'];
          final humidity = data['list'][0]['main']['humidity'];
          final wind_speed = data['list'][0]['wind']['speed'];
          final pressure = data['list'][0]['main']['pressure'];

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // main card
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 16,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text(
                                  city_name,
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Text(
                                //   'Date : $formattedDate',
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 25),
                                // ),
                                // Text(
                                //   formattedTime.toString(),
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 25),
                                // ),
                                Text(
                                  '${(c_temp).toStringAsFixed(1)} °C',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  curr_text == 'Clouds' || curr_text == 'Rain'
                                      ? Icons.cloud
                                      : Icons.sunny,
                                  size: 64,
                                ),
                                Text(
                                  curr_text,
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Weather Forecast',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 128,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              user_card(
                                time: data['list'][index + 1]['dt_txt']
                                    .toString()
                                    .substring(11, 16),
                                temp: (data['list'][index + 1]['main']['temp'] -
                                        273.15)
                                    .toStringAsFixed(1),
                                icon_i: data['list'][index + 1]['weather'][0]
                                                ['main'] ==
                                            'Clouds' ||
                                        data['list'][index + 1]['weather'][0]
                                                ['main'] ==
                                            'Rain'
                                    ? 'Clouds'
                                    : 'sunny',
                              ),
                            ],
                          );
                        }),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Additional information',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        additional_card(
                          icon: Icons.water_drop,
                          t: 'Humidity',
                          val: humidity,
                        ),
                        additional_card(
                          icon: Icons.air,
                          t: 'Wind speed',
                          val: wind_speed,
                        ),
                        additional_card(
                          icon: Icons.beach_access,
                          t: 'Pressure',
                          val: pressure,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Bottom_ui(
        onSearch: _searchCity,
      ),
    );
  }
}
