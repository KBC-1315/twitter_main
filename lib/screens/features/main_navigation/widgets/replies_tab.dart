import 'package:flutter/material.dart';

class RepliesTab extends StatelessWidget {
  const RepliesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.reply),
          title: Text('Reply to a thread'),
          subtitle: Text('2h ago'),
        ),
        ListTile(
          leading: Icon(Icons.reply),
          title: Text('Another reply'),
          subtitle: Text('4h ago'),
        ),
      ],
    );
  }
}
