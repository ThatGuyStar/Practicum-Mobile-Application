import 'package:flutter/material.dart';
import 'package:practicum/database/platforms.dart';
import 'package:practicum/database/message.dart';

class Preview extends StatefulWidget {
  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  TextEditingController messageController = TextEditingController();
  Message message;
  UserPlatform userPlatform = UserPlatform('Android', 'One');
  RecipientPlatform recipientPlatform = RecipientPlatform('Android', 'One');

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    messageController.dispose();
    super.dispose();
  }

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
                    'Preview Your Message',
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
              Text('SELECT YOUR PLATFORM'),
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
              Text('SELECT YOUR VERSION'),
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
          SizedBox(
            height: 25.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('SELECT RECIPIENT PLATFORM'),
              DropdownButton<String>(
                value: recipientPlatform.platform,
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
                    recipientPlatform.platform = newValue;
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
              Text('SELECT RECIPIENT VERSION'),
              DropdownButton<String>(
                value: recipientPlatform.version,
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
                    recipientPlatform.version = newValue;
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
          Column(
            children: [
              TextField(
                controller: messageController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    labelText: 'Enter Message',
                    hintText: 'Input Text',
                    border: OutlineInputBorder()),
              ),
              ElevatedButton(
                  child: Text('Preview Message'),
                  onPressed: () {
                    print('Pressed');
                    message = Message(messageController.text);
                    print(message.messageToConvert);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text(message.convertMessage(
                              messageController.text,
                              userPlatform.platform,
                              userPlatform.version,
                              recipientPlatform.platform,
                              recipientPlatform.version)),
                        );
                      },
                    );
                  }),
            ],
          )
        ],
      ),
    );
  }
}
