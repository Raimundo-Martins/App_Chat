import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage(this.data, this.mineMessage);

  final Map<String, dynamic> data;
  final bool mineMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          !mineMessage
              ? Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data['senderPhotoUrl']),
                  ),
                )
              : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment: mineMessage
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                data['imageUrl'] != null
                    ? Image.network(
                        data['imageUrl'],
                        width: 175,
                      )
                    : Text(
                        data['texto'],
                        style: TextStyle(fontSize: 18),
                      ),
                Text(
                  data['senderName'],
                  textAlign: mineMessage ? TextAlign.end : TextAlign.start,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          mineMessage
              ? Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data['senderPhotoUrl']),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
