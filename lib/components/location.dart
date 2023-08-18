import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Location extends StatelessWidget {
  final String city;

  const Location({
    super.key,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FeatherIcons.mapPin,
          size: 24,
          color: Colors.white,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          city,
          style: GoogleFonts.overpass(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
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
