import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NextForecastItem extends StatelessWidget {
  final int dt;
  final String icon;
  final dynamic temp;

  const NextForecastItem({
    super.key,
    required this.dt,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          DateFormat('HH:mm,\nd MMM')
              .format(DateTime.fromMillisecondsSinceEpoch(dt * 1000)),
          style: GoogleFonts.overpass(
            color: Colors.white,
            fontSize: 18,
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
        Image.asset(
          'assets/images/$icon.png',
          width: 44,
        ),
        Text(
          '${(temp - 273).round().toString()}°',
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
    );
  }
}
