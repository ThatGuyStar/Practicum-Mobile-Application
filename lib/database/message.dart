class Message {
  final String messageToConvert;
  String convertedMessage;

  Message(this.messageToConvert);

  String convertMessage(String originalMessage, String userDevice,
      String userOS, String recipientDevice, String recipientOS) {
    // ignore: unused_local_variable
    var recipientEmoji = fetchRecipientEmoji(recipientDevice, recipientOS);

    convertedMessage = 'USER MESSAGE: ' +
        messageToConvert +
        ', USER DEVICE: ' +
        userDevice +
        ', USER OS: ' +
        userOS +
        ', RECIPIENT DEVICE: ' +
        recipientDevice +
        ', RECIPIENT OS: ' +
        recipientOS;

    return convertedMessage;
  }

  fetchRecipientEmoji(var recipientDevice, var recipientOS) {
    print('YOU HAVE FETCHED EMOJIS');
    return null;
  }
}
