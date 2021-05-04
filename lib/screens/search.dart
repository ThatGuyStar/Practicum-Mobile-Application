import 'package:flutter/material.dart';
import 'package:practicum/database/platforms.dart';
import 'package:practicum/screens/searchResults.dart';

class SearchEmojiScreen extends StatefulWidget {
  @override
  _SearchEmojiScreenState createState() => _SearchEmojiScreenState();
}

class _SearchEmojiScreenState extends State<SearchEmojiScreen> {
  /// Store the platform and version of emojis the user wants to see.
  UserPlatform userPlatform = UserPlatform('Apple', 'iOS 14');

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
              // Choose the platform
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
                  // Reset the state when a option is selected.
                  setState(() {
                    userPlatform.platform = newValue;
                  });
                },
                items: <String>['Apple', 'Android', 'Twitter', 'Facebook']
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
              // Choose the version.
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
                  // Reset the state when a option is selected.
                  setState(() {
                    userPlatform.version = newValue;
                  });
                },
                items: <String>['iOS 14', 'iOS 13', 'iOS 12', 'iOS 11']
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
                // Send the user to a new screen that shows the emojis.
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
