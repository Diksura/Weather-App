
String cloudCoverMessage(int percentage) {
  if (percentage == 0) {
    return "Clear skies ahead. Enjoy the sunshine!";
  } else if (percentage < 20) {
    return "Mostly clear skies with a few clouds.";
  } else if (percentage < 50) {
    return "Partly cloudy skies, but still plenty of sun.";
  } else if (percentage < 80) {
    return "Cloudy skies with occasional breaks of sunshine.";
  } else if (percentage < 100) {
    return "Mostly overcast skies. Sunshine will be limited.";
  } else if (percentage == 100) {
    return "Completely overcast skies. No sun expected today.";
  } else {
    return "Cloud cover data is unavailable. Check local forecasts for updates.";
  }
}