import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  final String icon;

  const WeatherImage({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/$icon.png',
          width: 220,
        ),
      ],
    );
  }
}
