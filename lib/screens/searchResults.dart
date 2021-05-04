import 'package:emojis/emoji.dart' as EmojiGetter;
import 'package:flutter/material.dart';
//import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:practicum/database/platforms.dart';

class SearchResultsScreen extends StatelessWidget {
  /// Get all the emojis
  final List<EmojiGetter.Emoji> emList = EmojiGetter.Emoji.all();

  /// Get the users platform
  final UserPlatform userPlatform;

  SearchResultsScreen(this.userPlatform);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Emojis'),
          backgroundColor: Colors.black12,
        ),
        // Displays all the emojis in a scrollable list.
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: emList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.purple,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('${emList[index]} : ${emList[index].name}'),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}
