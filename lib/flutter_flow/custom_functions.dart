import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? validationFunction(
  String? password,
  String? confirmPassword,
) {
  if (password == confirmPassword) {
    return true;
  } else {
    return false;
  }
}

List<String> getNextSevenDays() {
  final now = DateTime.now();
  final dateFormat = DateFormat('EEEE, MMM d');

  return List.generate(7, (index) {
    final futureDate = now.add(Duration(days: index));
    return dateFormat.format(futureDate);
  });
}

String? fourDigitsMastercard(String? numTarjeta) {
  if (numTarjeta != null && numTarjeta.length >= 4) {
    final lastFourDigits = numTarjeta.substring(numTarjeta.length - 4);
    return 'Mastercard acabada en $lastFourDigits';
  } else {
    return null;
  }
}
