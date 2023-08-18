import 'dart:ui';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/forecast.dart';

class TodayWeatherCard extends StatelessWidget {
  final ListElement data;

  const TodayWeatherCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.5,
          sigmaY: 2.5,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white38,
              width: 2,
            ),
          ),
          width: 353,
          height: 335,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('HH:mm, d MMMM').format(
                    DateTime.fromMillisecondsSinceEpoch(data.dt * 1000)),
                style: GoogleFonts.overpass(
                  color: Colors.white,
                  fontSize: 18,
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
                height: 32,
              ),
              Text.rich(
                TextSpan(
                  text: (data.main.temp - 273).round().toString(),
                  style: GoogleFonts.overpass(
                    color: Colors.white,
                    fontSize: 100,
                    height: 1,
                    shadows: [
                      Shadow(
                        offset: const Offset(-4, 8),
                        blurRadius: 50,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                  ),
                  children: [
                    TextSpan(
                      text: '°',
                      style: GoogleFonts.overpass(
                        color: Colors.white,
                        fontSize: 100,
                        shadows: [
                          Shadow(
                            offset: const Offset(-4, 8),
                            blurRadius: 50,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                data.weather.first.description
                    .split(' ')
                    .map((word) => word.capitalize())
                    .join(' '),
                style: GoogleFonts.overpass(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
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
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 67,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FeatherIcons.wind,
                          size: 24,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: const Offset(-2, 3),
                              blurRadius: 1,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Wind',
                          style: GoogleFonts.overpass(
                            color: Colors.white,
                            fontSize: 18,
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
                          width: 23,
                        ),
                        Text(
                          '|',
                          style: GoogleFonts.overpass(
                            color: Colors.white,
                            fontSize: 14,
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
                          width: 20,
                        ),
                        Text(
                          '${(data.wind.speed * 3.6).toStringAsFixed(1)} km/h',
                          style: GoogleFonts.overpass(
                            color: Colors.white,
                            fontSize: 18,
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
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FeatherIcons.droplet,
                          size: 24,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: const Offset(-2, 3),
                              blurRadius: 1,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Hum',
                          style: GoogleFonts.overpass(
                            color: Colors.white,
                            fontSize: 18,
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
                          width: 25,
                        ),
                        Text(
                          '|',
                          style: GoogleFonts.overpass(
                            color: Colors.white,
                            fontSize: 14,
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
                          width: 20,
                        ),
                        Text(
                          '${data.main.humidity.toString()} %',
                          style: GoogleFonts.overpass(
                            color: Colors.white,
                            fontSize: 18,
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
