import 'package:flutter/material.dart';
import 'package:mod_chat/grpc_web_example/models/message_incoming.dart';

import 'chat_message.dart';

/// ChatMessageIncoming is widget to display incoming from server message
class ChatMessageIncoming extends StatelessWidget implements ChatMessage {
  /// Incoming message content
  final MessageIncoming message;

  /// Controller of animation for message widget
  final AnimationController animationController;

  /// Constructor
  ChatMessageIncoming({this.message, this.animationController})
      : super(key: Key(message.id));

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(message.senderName,
                      style: Theme.of(context).textTheme.subtitle1),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(message.text),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0),
              child: CircleAvatar(
                backgroundColor: Colors.pink.shade600,
                child: Text(message.senderName[0]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
