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
    '☆*:.｡.o(≧▽≦)o.｡.:*☆',
    '(o^▽^o)',
    '(⌒▽⌒)☆',
    '<(￣︶￣)>',
    'ヽ(・∀・)ﾉ',
    '(´｡• ω •｡`)',
    '(￣ω￣)',
    '(o･ω･o)',
    '(＠＾◡＾)',
    'ヽ(*・ω・)ﾉ',
    '(o_ _)ﾉ彡☆',
    '(^人^)',
    '(o´▽`o)',
    '(*´▽`*)',
    '｡ﾟ( ﾟ^∀^ﾟ)ﾟ｡',
    '( ´ ω ` )',
    '(((o(*°▽°*)o)))',
    '(≧◡≦)',
    '(o´∀`o)',
    '(´• ω •`)',
    '(＾▽＾)',
    '(⌒ω⌒)',
    '∑d(°∀°d)',
    '╰(▔∀▔)╯',
    '(─‿‿─)',
    '(*^‿^*)',
    'ヽ(o^ ^o)ﾉ',
    '(✯◡✯)',
    '(◕‿◕)',
    '(*≧ω≦*)',
    '(☆▽☆)',
    '(⌒‿⌒)',
    '＼(≧▽≦)／',
    'ヽ(o＾▽＾o)ノ',
    '(*°▽°*)',
    '٩(｡•́‿•̀｡)۶',
    '(✧ω✧)',
    'ヽ(*⌒▽⌒*)ﾉ',
    '(´｡• ᵕ •｡`)',
    '( ´ ▽ ` )',
    '(￣▽￣)',
    '╰(*´︶`*)╯',
    'ヽ(>∀<☆)ノ',
  ];

  Future<String> kaomojiAdder(String emotionText, double kaomojiIntensity, bool kaomojiOnlyAfterSentences) async {
    Random _randomNumberGenerator = Random();
    String randomKaomoji;
    String textToReplace;
    int currentPosition = 0;
    emotionText += ' ';

    if(kaomojiOnlyAfterSentences) {
      textToReplace = '. ';
    } else {
      textToReplace = ' ';
    }

    if(emotionText.contains(' ')) {
      currentPosition = emotionText.indexOf(textToReplace, currentPosition + 1);
      while(emotionText.substring(currentPosition + 1).contains(textToReplace)) {
        randomKaomoji = _kaomoji[_randomNumberGenerator.nextInt(_kaomoji.length)];
        if(_randomNumberGenerator.nextDouble() + kaomojiIntensity > 1) {
          emotionText = emotionText.replaceFirst(textToReplace, textToReplace + '$randomKaomoji ', currentPosition);
          currentPosition = emotionText.indexOf(textToReplace, currentPosition + randomKaomoji.length + 2);
        } else {
          currentPosition = emotionText.indexOf(textToReplace, currentPosition + 1);
        }
      }
      randomKaomoji = _kaomoji[_randomNumberGenerator.nextInt(_kaomoji.length)];
    }

    if(_randomNumberGenerator.nextDouble() + kaomojiIntensity > 1) {
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