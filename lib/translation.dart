class Translation {
  Map _Translations = {
    'ro':'wo',
    'ra':'wa',
    'le':'we',
    'ji':'wi',
    'er':'ew'
  };

// Previous efforts on adjustable enhancement process
//  String Translate(String textToTranslate) {
//    if(_Translations.containsKey(textToTranslate)) {
//      return _Translations[textToTranslate];
//    } else {
//      return textToTranslate;
//    }
//  }

  Future<String> Translate(String translationText) async {
    await _Translations.forEach((key, value) {
      translationText.replaceAll(key, value);
    });
    return translationText;
  }
}