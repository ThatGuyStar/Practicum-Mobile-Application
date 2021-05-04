// import 'package:emojis/emoji.dart' as EmojiGetter;
// import 'package:flutter/material.dart';
//import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:practicum/database/platforms.dart';

class Message {
  /// Stores original message to be converted.
  final String messageToConvert;

  // Platforms of current user and recipient.
  final UserPlatform userPlatform;
  final RecipientPlatform recipientPlatform;

  Message(this.messageToConvert, this.userPlatform, this.recipientPlatform);

  /// Stores new message with updated emojis to be sent.
  String convertedMessage = '';

  /// Stores the range to find the emojis.
  final RegExp regexEmoji = RegExp(
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');

  /// Swaps the emojis from the original messages to the new emojis.
  String convertMessage() {
    List textInMessage = messageToConvert.split(regexEmoji);
    print('textInMessage LIST: ' + textInMessage.toString());

    /// Collects all the emojis to convert
    Iterable<RegExpMatch> matches = regexEmoji.allMatches(messageToConvert);
    print('number of emojis: ' + matches.length.toString());

    /// Contains all the emojis with the recipients version
    List newEmojis = _fetchRecipientEmojis(matches);
    print('NEW EMOJIS: ' + newEmojis.toString());

    // Combines the text with the new emojis to remake the message to be sent.
    if (textInMessage.length > newEmojis.length) {
      for (int i = 0; i < newEmojis.length; i++) {
        if (textInMessage[i] != '') {
          convertedMessage += textInMessage[i] + newEmojis[i];
        } else {
          convertedMessage += newEmojis[i] + textInMessage[i];
        }
      }
    } else {
      for (int i = 0; i < newEmojis.length; i++) {
        if (textInMessage[i] != '') {
          convertedMessage += textInMessage[i] + newEmojis[i];
        } else {
          convertedMessage += newEmojis[i] + textInMessage[i];
        }
      }
    }

    return convertedMessage;
  }

  /// Fetches all of the emojis for how it would look on the recipients device.
  List _fetchRecipientEmojis(Iterable<RegExpMatch> oldEmojis) {
    // ignore: deprecated_member_use
    List newEmojiList = new List(oldEmojis.length);
    print('Entered -> _fetchRecipientEmojis');
    print('Selected Device: ' + recipientPlatform.platform);
    print('Selected OS: ' + recipientPlatform.version);

    for (int i = 0; i < oldEmojis.length; i++) {
      print("" + i.toString() + ": " + oldEmojis.elementAt(0).toString());
      newEmojiList[i] = '❤️';
    }

    return newEmojiList;
  }
}
