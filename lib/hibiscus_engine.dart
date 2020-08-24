import 'package:flutter/foundation.dart';
import 'package:hibiscus/translation.dart';

Future<String> hibiscusEngine({@required String textToProcess, @required double kaomojiIntensity, @required double commentsIntensity, @required bool textAlteration, @required bool kaomojiInsertion, @required bool commentsInsertion}) async {

  String processedText = textToProcess;

  if(textAlteration) {
    Translation translationHandler = Translation();
    processedText = await translationHandler.translate(processedText);
  }

  return processedText;
} // TODO: Hibiscus Engine