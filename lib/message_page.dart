import 'package:flutter/material.dart';

import 'models/conversation_model.dart';

class MessagesScreen extends StatelessWidget {
  // Sample data for conversations
  List<Conversation> conversations = [
    Conversation(
      senderName: "John Smith",
      messagePreview: "Hi! How are you doing?",
      timestamp: "2 min ago",
    ),
    Conversation(
      senderName: "Savannah Nguyen",
      messagePreview: "Haha that's terrifying 😱",
      timestamp: "5 min ago",
    ),
    Conversation(
      senderName: "Albert Flores",
      messagePreview: "aww",
      timestamp: "Yesterday",
    ),
    Conversation(
      senderName: "Marvin McKinney",
      messagePreview: "Wow, this is really epic",
      timestamp: "2 days ago",
    ),
    Conversation(
      senderName: "Devon Lane",
      messagePreview: "Haha oh man",
      timestamp: "2 days ago",
    ),
    Conversation(
      senderName: "Theresa Webb",
      messagePreview: "How are you?",
      timestamp: "3 days ago",
    ),
    Conversation(
      senderName: "Darlene Robertson",
      messagePreview: "I'll be there in 2 mins",
      timestamp: "4 days ago",
    ),
    Conversation(
      senderName: "Jenny Wilson",
      messagePreview: "perfect!",
      timestamp: "a week ago",
    ),
  ];

  MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        backgroundColor: Color(0xFF3b9678),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search \"Your Friend\"",
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.mic),
                  onPressed: () {},
                ),
              ),
            ),
          ),

          // Conversation List
          Expanded(
            child: ListView.builder(
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                final conversation = conversations[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/200 ', // Replace with actual profile pictures
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        conversation.senderName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        conversation.timestamp,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  subtitle: Text(conversation.messagePreview),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}