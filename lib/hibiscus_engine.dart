import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:hibiscus/translation.dart';

Future<String> hibiscusEngine({@required String textToProcess, @required double textEnhancementIntensity, @required double kaomojiIntensity, @required double commentsIntensity, @required bool textAlteration, @required bool kaomojiInsertion, @required bool commentsInsertion}) async {

    String processedText = textToProcess;

// Previous efforts on adjustable enhancement process
//  if(textAlteration) {
//    String substringToTranslate;
//    String translatedSubstring;
//    String translatedString = '';
//    int firstLetterOfSubstring = 0;
//    int textLength = textToProcess.length;
//    Translation translationHandler = Translation();
//    Random randomNumberGenerator = Random();
//    for(int i = 0; i < textLength - 1; i++) {
//      substringToTranslate = textToProcess.substring(firstLetterOfSubstring + i, firstLetterOfSubstring + i + 2);
//      if(randomNumberGenerator.nextDouble() + textEnhancementIntensity > 1) {
//        translatedSubstring = translationHandler.Translate(substringToTranslate);
//        translatedString += translatedSubstring;
//      } else {
//        translatedString += substringToTranslate;
//      }
//    }
//    processedText = translatedString;
//  }

  if(textAlteration) {
    Translation translationHandler = Translation();
    processedText = await translationHandler.Translate(processedText);
  }

  return processedText;
} // TODO: Hibiscus Engine