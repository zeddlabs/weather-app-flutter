import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/forecast.dart';
import 'next_forecast_item.dart';

class NextForecast extends StatelessWidget {
  final List<ListElement> data;
  final ScrollController scrollForecast = ScrollController();

  NextForecast({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Next Forecast',
          style: GoogleFonts.overpass(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w900,
            height: 1,
            shadows: [
              Shadow(
                offset: const Offset(-2, 3),
                blurRadius: 1,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
              scrollbarTheme: ScrollbarThemeData(
                thumbColor: MaterialStateProperty.all(Colors.white),
                trackBorderColor:
                    MaterialStateProperty.all(Colors.white.withOpacity(0.5)),
                trackColor: MaterialStateProperty.all(Colors.transparent),
              ),
            ),
            child: Scrollbar(
              controller: scrollForecast,
              thumbVisibility: true,
              trackVisibility: true,
              thickness: 6,
              radius: const Radius.circular(5),
              child: Container(
                padding: const EdgeInsets.only(right: 24),
                height: 340,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return NextForecastItem(
                        dt: data[index + 1].dt,
                        icon: data[index + 1].weather.first.icon,
                        temp: data[index + 1].main.temp);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: data.length - 1,
                  shrinkWrap: true,
                  controller: scrollForecast,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
