import 'package:owotion/translation.dart';

Future<String> transformator(Map _transformatorParameters) async {
  String _processedText = _transformatorParameters['textToProcess'];

  if (_transformatorParameters['textAlteration']) {
    Translation translationHandler = Translation();
    _processedText = await translationHandler.translate(_processedText);
  }

  if (_transformatorParameters['kaomojiInsertion']) {
    Kaomoji kaomojiHandler = Kaomoji();
    _processedText = await kaomojiHandler.kaomojiAdder(
        _processedText,
        _transformatorParameters['kaomojiIntensity'],
        _transformatorParameters['kaomojiOnlyAfterSentences']);
  }

  // TODO: Comment insertion

  return _processedText;
}
