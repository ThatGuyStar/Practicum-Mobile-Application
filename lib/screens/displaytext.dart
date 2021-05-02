// import 'package:flutter/material.dart';
// import 'package:practicum/database/message.dart';

// class DisplayTextScreen extends StatefulWidget {
//   final Message message;
//   DisplayTextScreen(this.message);
//   @override
//   _DisplayTextScreenState createState() =>
//       _DisplayTextScreenState(this.message);
// }

// class _DisplayTextScreenState extends State<DisplayTextScreen> {
//   Message messageToPreview;
//   _DisplayTextScreenState(this.messageToPreview);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           RichText(text: TextSpan(text: messageToPreview.displayMessage)),
//           RichText(text: TextSpan(text: 'how use message looks to other')),
//           Row(
//             children: [
//               ElevatedButton(
//                   child: Text('Cancel'),
//                   onPressed: () {
//                     print('Pressed');
//                     Navigator.pop(context);
//                   }),
//               SizedBox(
//                 width: 10,
//               ),
//               ElevatedButton(
//                   child: Text('Copy Message'),
//                   onPressed: () {
//                     print('Pressed');
//                   }),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
