String precipitationValue(double precipitation) {
  if (precipitation < 10) {
    return ((precipitation * 10).round() / 10).toStringAsFixed(1);
  }
  return precipitation.round().toString();
}

String precipitationMessage(double precipitation) {
  if (precipitation == 0) {
    return "No precipitation expected. Enjoy a clear day!";
  } else if (precipitation < 2.5) {
    return "A light drizzle is possible.";
  } else if (precipitation < 10) {
    return "Light rain is expected.";
  } else if (precipitation < 50) {
    return "Moderate rain is forecast.";
  } else if (precipitation < 100) {
    return "Heavy rain is expected.";
  } else {
    return "Severe rainfall forecast.";
  }
}
