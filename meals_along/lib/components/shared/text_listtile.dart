import "package:flutter/material.dart";

class TextListTile extends StatelessWidget {
  final String leadingText;
  final String contentText;

  const TextListTile(
      {Key? key, required this.leadingText, required this.contentText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(child: Text(leadingText)),
        title: Text(contentText));
  }
}
