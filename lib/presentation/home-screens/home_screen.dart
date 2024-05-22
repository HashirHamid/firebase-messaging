import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/firebase_repo.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<RemoteMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase push notifications"),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<RemoteMessage>(
        stream: notificationSubscription!.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _messages.add(snapshot.data!);
          }
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title: ${message.notification!.title}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Body: ${message.notification!.body}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
