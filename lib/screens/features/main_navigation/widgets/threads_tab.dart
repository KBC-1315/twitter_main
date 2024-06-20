import 'package:flutter/material.dart';

class ThreadsTab extends StatelessWidget {
  const ThreadsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.chat_bubble_outline),
          title: Text(
              'Give @john_mobbin a follow if you want to see more travel content!'),
          subtitle: Text('5h ago'),
        ),
        ListTile(
          leading: Icon(Icons.chat_bubble_outline),
          title: Text('Tea. Spillage.'),
          subtitle: Text('6h ago'),
        ),
      ],
    );
  }
}
