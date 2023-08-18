import 'package:flutter/material.dart';

import '../components/footer.dart';
import '../components/location.dart';
import '../components/next_forecast.dart';
import '../components/today_weather_card.dart';
import '../components/weather_image.dart';
import '../models/forecast.dart';
import '../services/openweathermap_api.dart';
import '../services/user_position.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Forecast> getForecast() async {
    final position = await UserPosition.determinePosition();
    Forecast forecast =
        await OpenWeatherAPI.getForecast(position.latitude, position.longitude);

    return forecast;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF47BFDF),
                Color(0xFF4A91FF),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Image.asset(
                    'assets/images/bg_accent.png',
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                SafeArea(
                  child: FutureBuilder(
                    future: getForecast(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 52,
                            ),
                            Location(
                              city: snapshot.data!.city.name,
                            ),
                            const SizedBox(
                              height: 56,
                            ),
                            WeatherImage(
                              icon:
                                  snapshot.data!.list.first.weather.first.icon,
                            ),
                            const SizedBox(
                              height: 56,
                            ),
                            TodayWeatherCard(
                              data: snapshot.data!.list.first,
                            ),
                            const SizedBox(
                              height: 56,
                            ),
                            NextForecast(
                              data: snapshot.data!.list,
                            ),
                            const SizedBox(
                              height: 56,
                            ),
                            const Footer(),
                            const SizedBox(
                              height: 24,
                            )
                          ],
                        );
                      } else {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
