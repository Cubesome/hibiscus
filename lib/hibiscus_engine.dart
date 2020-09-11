import 'package:flutter/foundation.dart';
import 'package:hibiscus/translation.dart';

Future<String> hibiscusEngine(
    {@required String textToProcess,
    @required double kaomojiIntensity,
    @required double commentsIntensity,
    @required bool textAlteration,
    @required bool kaomojiInsertion,
    @required bool kaomojiOnlyAfterSentences,
    @required bool commentsInsertion}) async {
  String _processedText = textToProcess;

  if (textAlteration) {
    Translation translationHandler = Translation();
    _processedText = await translationHandler.translate(_processedText);
  }

  if (kaomojiInsertion) {
    Kaomoji kaomojiHandler = Kaomoji();
    _processedText = await kaomojiHandler.kaomojiAdder(
        _processedText, kaomojiIntensity, kaomojiOnlyAfterSentences);
  }

  // TODO: Comment insertion

  return _processedText;
}

Future<String> hibiscusEngineAsync(Map _hibiscusEngineParameters) async {
  String _processedText = _hibiscusEngineParameters['textToProcess'];

  if (_hibiscusEngineParameters['textAlteration']) {
    Translation translationHandler = Translation();
    _processedText = await translationHandler.translate(_processedText);
  }

  if (_hibiscusEngineParameters['kaomojiInsertion']) {
    Kaomoji kaomojiHandler = Kaomoji();
    _processedText = await kaomojiHandler.kaomojiAdder(
        _processedText,
        _hibiscusEngineParameters['kaomojiIntensity'],
        _hibiscusEngineParameters['kaomojiOnlyAfterSentences']);
  }

  // TODO: Comment insertion

  return _processedText;
}
