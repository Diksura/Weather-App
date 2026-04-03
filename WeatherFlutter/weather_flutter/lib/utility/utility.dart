import 'dart:math';

import 'package:intl/intl.dart' show DateFormat;

class Utility {
  double roundDouble(double value, int decimalPoint) {
    final multiplier = pow(10, decimalPoint);
    return (value * multiplier).round() / multiplier;
  }

  String getCurrentDateString() {
    final now = DateTime.now();
    return DateFormat('yyyy-MM-dd').format(now);
  }

  String getNextDateString() {
    final nextDate = DateTime.now().add(const Duration(days: 1));
    return DateFormat('yyyy-MM-dd').format(nextDate);
  }

  String getCurrentHourString() {
    final now = DateTime.now();
    return DateFormat('HH').format(now);
  }

  String formatDateString(String inputDateString) {
    try {
      final date = DateFormat('yyyy-MM-dd').parse(inputDateString);
      return DateFormat('dd EEEE').format(date); // 26 Tuesday
    } catch (_) {
      return inputDateString;
    }
  }

  String formatDateTime(String inputDateString) {
    try {
      final date = DateFormat('yyyy-MM-dd').parse(inputDateString);
      return DateFormat('dd EEEE yyyy HH:mm').format(date);
    } catch (_) {
      return inputDateString;
    }
  }

  String formatDateWithDateTimeUTC(String inputDateString) {
    try {
      final date = DateTime.parse(inputDateString);
      return DateFormat('yyyy-MM-dd h:mm a').format(date.toLocal());
    } catch (_) {
      return inputDateString;
    }
  }

  String formatTimeToHours(String time) {
    try {
      final inputFormat = DateFormat("yyyy-MM-dd HH:mm");
      final outputFormat = DateFormat("ha");

      final date = inputFormat.parse(time);
      return outputFormat.format(date);
    } catch (e) {
      return "N/A";
    }
  }

  bool isSameDateTime(String dateTimeSt, DateTime currentDate) {
    try {
      final inputFormat = DateFormat("yyyy-MM-dd HH:mm");
      final dateTime = inputFormat.parse(dateTimeSt);

      if (dateTime == currentDate) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception("isSameDateTime() --> $e");
    }
  }

}