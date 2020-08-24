class Translation {
  Map _translations = {
    'ro':'wo',
    'ra':'wa',
    'le':'we',
    'ji':'wi',
    'er':'ew',
    'ri':'wi',
  };

  Future<String> translate(String translationText) async {
    _translations.forEach((key, value) {
      translationText = translationText.replaceAll(key, value);
    });
    return translationText;
  }
}