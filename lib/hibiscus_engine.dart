import 'package:hibiscus/translation.dart';

Future<String> hibiscusEngine(Map _hibiscusEngineParameters) async {
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
