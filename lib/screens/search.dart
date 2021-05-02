import 'package:flutter/material.dart';
import 'package:practicum/database/platforms.dart';
import 'package:practicum/screens/searchResults.dart';

class SearchEmojiScreen extends StatefulWidget {
  @override
  _SearchEmojiScreenState createState() => _SearchEmojiScreenState();
}

class _SearchEmojiScreenState extends State<SearchEmojiScreen> {
  UserPlatform userPlatform = UserPlatform('Android', 'One');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Select operating system to search',
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.5,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('SELECT PLATFORM'),
              DropdownButton<String>(
                value: userPlatform.platform,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.purpleAccent),
                underline: Container(
                  height: 2,
                  color: Colors.purpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    userPlatform.platform = newValue;
                  });
                },
                items: <String>['Android', 'Apple', 'Twitter', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('SELECT VERSION'),
              DropdownButton<String>(
                value: userPlatform.version,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.purpleAccent),
                underline: Container(
                  height: 2,
                  color: Colors.purpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    userPlatform.version = newValue;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
          ElevatedButton(
              child: Text('Preview Message'),
              onPressed: () {
                print('Pressed');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchResultsScreen(userPlatform)),
                );
              }),
        ],
      ),
    );
  }
}
