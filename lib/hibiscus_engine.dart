import 'package:flutter/foundation.dart';
import 'package:hibiscus/translation.dart';

Future<String> hibiscusEngine({@required String textToProcess, @required double kaomojiIntensity, @required double commentsIntensity, @required bool textAlteration, @required bool kaomojiInsertion, @required bool kaomojiOnlyAfterSentences, @required bool commentsInsertion}) async {

  String processedText = textToProcess;

  if(textAlteration) {
    Translation translationHandler = Translation();
    processedText = await translationHandler.translate(processedText);
  }

  if(kaomojiInsertion) {
    Kaomoji kaomojiHandler = Kaomoji();
    processedText = await kaomojiHandler.kaomojiAdder(processedText, kaomojiIntensity, kaomojiOnlyAfterSentences);
  }

  // TODO: Comment insertion

  return processedText;
}