// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:loan_app/notifications.dart';
import 'package:loan_app/settings.dart';
import 'About_us.dart';
import 'communityscreen.dart';
import 'supportscreen.dart';
import 'homescreen.dart';

class Wash_App extends StatefulWidget {
  const Wash_App({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Wash_AppState createState() => _Wash_AppState();
}

class _Wash_AppState extends State<Wash_App> {
  void _openIconButtonPressed() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const SettingsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('WASH App'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notifications()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: _openIconButtonPressed,
              ),
            ],
          ),
          body: const TabBarView(
              children: [
                HomeScreen(),
                Community(),
                AboutUs(),
                SupportScreen(),
              ],
            ),
        
          bottomNavigationBar: const Padding(
            padding: EdgeInsets.all(0), // Remove padding
            child: TabBar(
              indicatorPadding: EdgeInsets.zero, // Minimize space around the indicator
              labelPadding: EdgeInsets.zero, // Minimize space around the labels
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.people)),
                Tab(icon: Icon(Icons.update)),
                Tab(icon: Icon(Icons.support)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
