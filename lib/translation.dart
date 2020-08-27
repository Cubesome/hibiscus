import 'dart:math';

class Translation {
  Map _translations = {
    'R':'W',
    'L':'W',
    'r':'w',
    'l':'w',
  };

  Future<String> translate(String translationText) async {
    _translations.forEach((key, value) {
      translationText = translationText.replaceAll(key, value);
    });
    return translationText;
  }
}

class Kaomoji {
  List<String> _kaomoji = [
    'OwO',
    'UwU',
    'owo',
    'uwu',
    '(* ^ ω ^)',
    '(´ ∀ ` *)',
    '٩(◕‿◕｡)۶',
    '(￣ω￣)',
    '(o･ω･o)',
    '(＠＾◡＾)',
    'ヽ(*・ω・)ﾉ',
    '(o_ _)ﾉ彡☆',
    '(^人^)',
    '(o´▽`o)',
    '(*´▽`*)',
    '(☆▽☆)',
    '(⌒‿⌒)',
    '＼(≧▽≦)／',
    'ヽ(o＾▽＾o)ノ',
    '(*°▽°*)',
    '٩(｡•́‿•̀｡)۶',
    '(o^▽^o)',
    '(⌒▽⌒)☆',
    '<(￣︶￣)>',
    'ヽ(・∀・)ﾉ',
    '(✧ω✧)',
    'ヽ(*⌒▽⌒*)ﾉ',
    '(≧◡≦)',
    '(o´∀`o)',
    '(´• ω •`)',
    '(＾▽＾)',
    '(⌒ω⌒)',
    '∑d(°∀°d)',
    'ヽ(>∀<☆)ノ',
    '╰(▔∀▔)╯',
    '(─‿‿─)',
    '(*^‿^*)',
    'ヽ(o^ ^o)ﾉ',
    '(✯◡✯)',
    '(◕‿◕)',
    '(*≧ω≦*)',
    '( ´ ▽ ` )',
    '(￣▽￣)',
    '╰(*´︶`*)╯',
  ];

  Future<String> kaomojiAdder(String emotionText, double kaomojiIntensity, bool kaomojiOnlyAfterSentences) async {
    Random _randomNumberGenerator = Random();
    String randomKaomoji;
    String textToReplace;
    int currentPosition = 0;

    if(kaomojiOnlyAfterSentences) {
      textToReplace = '. ';
    } else {
      textToReplace = ' ';
    }

    if(emotionText.contains(textToReplace)) {
      //currentPosition = emotionText.indexOf(textToReplace, currentPosition);
      while(currentPosition != -1) {
        currentPosition = emotionText.indexOf(textToReplace, currentPosition);
        if(_randomNumberGenerator.nextDouble() + kaomojiIntensity > 1) {
          randomKaomoji = _kaomoji[_randomNumberGenerator.nextInt(_kaomoji.length)];
          emotionText = emotionText.replaceFirst(textToReplace, textToReplace + '$randomKaomoji ', currentPosition);
          //currentPosition += randomKaomoji.length + textToReplace.length + 1;
          //currentPosition = emotionText.indexOf(textToReplace, currentPosition);
          currentPosition = emotionText.indexOf(textToReplace, currentPosition + randomKaomoji.length + textToReplace.length + 1);
        } else {
          currentPosition = emotionText.indexOf(textToReplace, currentPosition + textToReplace.length);
        }
      }
    }

    if(_randomNumberGenerator.nextDouble() + kaomojiIntensity > 1 && kaomojiOnlyAfterSentences == false && emotionText.startsWith(' ') == false) {
      randomKaomoji = _kaomoji[_randomNumberGenerator.nextInt(_kaomoji.length)];
      emotionText = '$randomKaomoji $emotionText';
    }

    // This code is a better implementation of the commented version above it.
    if((_randomNumberGenerator.nextDouble() + kaomojiIntensity > 1 && emotionText.endsWith('.') == true) || (kaomojiOnlyAfterSentences == false && emotionText.endsWith(' ') == false)) {
      randomKaomoji = _kaomoji[_randomNumberGenerator.nextInt(_kaomoji.length)];
      emotionText += ' $randomKaomoji';
    }

    return emotionText;
  }
}

// TODO: Comments
//class Comments {
//  List<String> _comments = [
//    '*blushes*',
//    '*'
//  ];
//}