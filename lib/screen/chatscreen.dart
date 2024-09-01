import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* backgroundColor:Colors.blueGrey,*/
      appBar: AppBar(
        title: const Text('Chat'),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/OIP.WgfHlrZKXW0yjkMz0Zn3AgHaEo?rs=1&pid=ImgDetMain'),
            ),
            title: Text('User ${index + 1}'),
            subtitle: const Text('Hello, how are you?'),
            trailing: const Text('Yesterday'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.message),
      ),
    );
  }
}
