import 'package:emojis/emoji.dart' as EmojiGetter;

//import 'package:flutter_emoji/flutter_emoji.dart';
final List<int> colorCodes = <int>[600, 500, 100];
final List<EmojiGetter.Emoji> emList = EmojiGetter.Emoji.all();
final str = "I am :grinning:";
final RegExp regexEmoji = RegExp(
    r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');

List<String> fetchEmojis(userPlatform) {
  print('Selected Device: ' + userPlatform.platform);
  print('Selected OS: ' + userPlatform.version);

  var test = 'Hello 😀 😇 how are you. 😇';
  final matches = regexEmoji.allMatches(test);
  var list = test.split(regexEmoji);

  //var parser = EmojiParser();
  var match = matches.elementAt(0);
  print(matches.length);
  print('PARSER: ' + match.group(0));
  print('LIST: ' + list.toString());
  return <String>['😀', '😇', '😮‍'];
}
