import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String title = 'first item';
  String item1 = 'first item';
  String item2 = 'second item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListTile(
        title: Text(title),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: item1,
              child: Text(item1),
            ),
            PopupMenuItem(
              value: item2,
              child: Text(item2),
            ),
          ],
          onSelected: (String newValue) {
            setState(() {
              title = newValue;
            });
          },
        ),
      ),
    );
  }
}
