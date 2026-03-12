enum WeatherType { sunny, partlyCloudy, cloudy, rain, heavyRain, snow, thunder, unknown }

// Sunny | Clear
const sunny = {1000};

// Partly cloudy
const partlyCloudy = {1003};

// Cloudy | Overcast | Mist | Fog | Freezing Fog
const cloudy = {1006, 1009, 1030, 1135, 1147};

// Patchy rain | Light rain | Light rain shower | Patchy sleet | Light sleet showers
// Light drizzle | Freezing drizzle | Freezing rain | Light sleet | Moderate or heavy sleet
const rain = {1063, 1180, 1183, 1240, 1150, 1153, 1168, 1171, 1198, 1201, 1069, 1249, 1204, 1207};

// Heavy rain | Torrential rain shower
const heavyRain = {1192, 1195, 1243, 1246};

// Patchy snow | Light snow | Light snow showers | Blowing snow | Blizzard
// Moderate snow | Heavy snow | Snow showers | Ice pellets | Ice pellet showers
const snow = {1066, 1210, 1213, 1255, 1114, 1117, 1216, 1219, 1222, 1225, 1258, 1237, 1261, 1264};

// Thunder | Thunder with rain | Thunder with snow
const thunder = {1087, 1273, 1276, 1279, 1282};

WeatherType getWeatherImageType(int code) {
  if (sunny.contains(code)) return WeatherType.sunny;
  if (partlyCloudy.contains(code)) return WeatherType.partlyCloudy;
  if (cloudy.contains(code)) return WeatherType.cloudy;
  if (heavyRain.contains(code)) return WeatherType.heavyRain;
  if (rain.contains(code)) return WeatherType.rain;
  if (snow.contains(code)) return WeatherType.snow;
  if (thunder.contains(code)) return WeatherType.thunder;

  return WeatherType.unknown;
}

extension WeatherTypeAssets on WeatherType {
  String get asset {
    switch (this) {
      case WeatherType.sunny:
        return "Sunny";

      case WeatherType.partlyCloudy:
        return "Cloudy-Sunny";

      case WeatherType.cloudy:
        return "Cloudy-Cold";

      case WeatherType.rain:
        return "Rain";

      case WeatherType.heavyRain:
        return "Heavy-Rain";

      case WeatherType.snow:
        return "Snow";

      case WeatherType.thunder:
        return "Cloudy-Thunder";

      case WeatherType.unknown:
        return "Temp-Cold";
    }
  }
}
