class Forecast {
  List<ListElement> list;
  City city;

  Forecast({
    required this.list,
    required this.city,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      list: List<ListElement>.from(
          json['list'].map((item) => ListElement.fromJson(item))),
      city: City.fromJson(json['city']),
    );
  }
}

class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      coord: Coord.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

class Coord {
  double lat;
  double lon;

  Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}

class ListElement {
  int dt;
  MainClass main;
  List<Weather> weather;
  Wind wind;
  String dtTxt;

  ListElement({
    required this.dt,
    required this.main,
    required this.weather,
    required this.wind,
    required this.dtTxt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) {
    return ListElement(
      dt: json['dt'],
      main: MainClass.fromJson(json['main']),
      weather: List<Weather>.from(
          json['weather'].map((item) => Weather.fromJson(item))),
      wind: Wind.fromJson(json['wind']),
      dtTxt: json['dt_txt'],
    );
  }
}

class MainClass {
  dynamic temp;
  int humidity;

  MainClass({
    required this.temp,
    required this.humidity,
  });

  factory MainClass.fromJson(Map<String, dynamic> json) {
    return MainClass(
      temp: json['temp'],
      humidity: json['humidity'],
    );
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Wind {
  double speed;

  Wind({
    required this.speed,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
    );
  }
}
