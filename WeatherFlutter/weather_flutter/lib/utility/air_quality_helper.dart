import 'package:flutter/material.dart';

({String band, String range, Color color}) airQualityBand(int index, bool isAirUKDefra) {

  if (isAirUKDefra) {

    switch (index) {
      case 1:
        return (band: "Low", range: "0 - 11", color: Colors.green);

      case 2:
        return (band: "Low", range: "12 - 23", color: Colors.green);

      case 3:
        return (band: "Low", range: "24 - 35", color: Colors.green);

      case 4:
        return (band: "Moderate", range: "36 - 41", color: Colors.yellow);

      case 5:
        return (band: "Moderate", range: "42 - 47", color: Colors.yellow);

      case 6:
        return (band: "Moderate", range: "48 - 53", color: Colors.yellow);

      case 7:
        return (band: "High", range: "54 - 58", color: Colors.orange);

      case 8:
        return (band: "High", range: "59 - 64", color: Colors.orange);

      case 9:
        return (band: "High", range: "65 - 70", color: Colors.orange);

      case 10:
        return (band: "Very High", range: "71+", color: Colors.red);

      default:
        return (band: "Unknown", range: "Index out of range", color: Colors.grey);
    }

  } else {

    switch (index) {
      case 1:
        return (band: "Good", range: "0.0 – 12.0 µgm\u{207B}\u{00B3}", color: Colors.green);

      case 2:
        return (band: "Moderate", range: "12.1 – 35.4 µgm\u{207B}\u{00B3}", color: Colors.yellow);

      case 3:
        return (band: "Unhealthy for Sensitive Groups", range: "35.5 – 55.4 µgm\u{207B}\u{00B3}", color: Colors.orange);

      case 4:
        return (band: "Unhealthy", range: "55.5 – 150.4 µgm\u{207B}\u{00B3}", color: Colors.red);

      case 5:
        return (band: "Very Unhealthy", range: "150.5 – 250.4 µgm\u{207B}\u{00B3}", color: Colors.purple);

      case 6:
        return (band: "Hazardous", range: "250.5+ µgm\u{207B}\u{00B3}", color: const Color.fromARGB(255, 128, 0, 0));

      default:
        return (band: "Unknown", range: "No Data", color: Colors.grey);
    }

  }
}
