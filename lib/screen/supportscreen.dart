// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
      ),
      body: ListView(
        children: const [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'How can we help?',
              style: TextStyle(fontSize: 24),
            ),
          ]),
          SizedBox(height: 16),
          Column(children: [
            Text(
              'Contact Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.headset),
              SizedBox(width: 8),
              Text('Tel: 0789008900'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.headset),
              SizedBox(width: 8),
              Text('Fax: 0090087777777'),
            ],
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              'Email',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email),
              SizedBox(width: 8),
              Text('washapplication@gmail.com'),
            ],
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              'Website',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.link),
              SizedBox(width: 8),
              Text('https://www.tz'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.instagram),
              SizedBox(width: 8),
              Text('Instagram'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.facebook),
              SizedBox(width: 8),
              Text('facebook'),
            ],
          ),
        ],
      ),
    );
  }
}
