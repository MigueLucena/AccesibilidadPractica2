// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_tts/flutter_tts.dart';

Future textToSpeech(
  String? myText,
  String? lang,
) async {
  // i need somethin like that if (myText == null || myText.isEmpty) {     return;   } FlutterTts flutterTts = FlutterTts();    // Verifica que el parámetro lang no esté vacío antes de establecer el idioma   if (lang != null && lang.isNotEmpty) {     flutterTts.setLanguage(lang);   } else {     // Si no se proporciona el idioma, establece el idioma predeterminado en inglés (en-US)     flutterTts.setLanguage("es-ES");   } String text = myText;   await flutterTts.speak(text);
  if (myText == null || myText.isEmpty) {
    return;
  }

  FlutterTts flutterTts = FlutterTts();

  if (lang != null && lang.isNotEmpty) {
    flutterTts.setLanguage(lang);
  } else {
    flutterTts.setLanguage("es-ES");
  }

  String text = myText;
  await flutterTts.speak(text);
}
