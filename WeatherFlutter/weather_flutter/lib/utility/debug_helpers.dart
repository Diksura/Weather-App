// ANSI escape code constants
import 'package:flutter/material.dart';

const String k_debug_reset = '\x1B[0m';
const String k_debug_red = '\x1B[31m';
const String k_debug_green = '\x1B[32m';
const String k_debug_yellow = '\x1B[33m';
const String k_debug_blue = '\x1B[34m';
const String k_debug_magenta = '\x1B[35m';
const String k_debug_cyan = '\x1B[36m';
const String k_debug_white = '\x1B[37m';

void errorPrint(String message) {
  debugPrint("${k_debug_red}ERROR$k_debug_reset | $message");
}

void successPrint(String message) {
  debugPrint("${k_debug_green}SUCCESS$k_debug_reset | $message");
}

void warningPrint(String message) {
  debugPrint("${k_debug_yellow}WARNING$k_debug_reset | $message");
}

void checkPrint(String message) {
  debugPrint("${k_debug_cyan}CHECK$k_debug_reset | $message");
}