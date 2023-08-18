import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'API From OpenWeatherMap',
          style: GoogleFonts.overpass(
            color: Colors.white,
            fontSize: 16,
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
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Made with ',
              style: GoogleFonts.overpass(
                color: Colors.white,
                fontSize: 16,
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
            const Icon(
              FeatherIcons.heart,
              color: Colors.pink,
              size: 18,
            ),
            Text(
              ' by Zul',
              style: GoogleFonts.overpass(
                color: Colors.white,
                fontSize: 16,
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
        )
      ],
    );
  }
}
