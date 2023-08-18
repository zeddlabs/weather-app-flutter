import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/forecast.dart';

class OpenWeatherAPI {
  static Future<Forecast> getForecast(double lat, double lon) async {
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=${dotenv.env["OPENWEATHERMAP_API_KEY"]}';

    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);

    Forecast result = Forecast.fromJson(jsonData);

    return result;
  }
}
