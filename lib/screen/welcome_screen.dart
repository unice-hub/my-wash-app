// ignore_for_file: unused_local_variable, avoid_print, use_build_context_synchronously, unused_import, avoid_unnecessary_containers
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loan_app/screen/Wash_App.dart';
import 'package:loan_app/screen/registration.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 167, 167),
      appBar: AppBar(
        title: const Text(
          'Welcome',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 43, 43),
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: MediaQuery.of(context).size.height < 600
                        ? 0.3
                        : 0.5, // Adjusting heightFactor based on screen size
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          width: constraints
                              .maxWidth, // Ensures the container takes the full width
                          height: constraints
                              .maxHeight, // Takes the height provided by FractionallySizedBox
                          child: Image.asset(
                            'assets/images/kidswithwater.jpg',
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  const Positioned(
                    bottom: 100,
                    left: 0,
                    right: 0,
                    height: 120,
                    child: Center(
                      child: Text(
                        'Water is an essential component for every livingthing.Having access to clean and safe treated water to use is quite a priority in our societies.',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.5,
                    child: Image.asset(
                      'assets/images/world-clean-up-day.jpg',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                  const Positioned(
                    bottom: 100,
                    left: 0,
                    right: 0,
                    height: 120,
                    child: Center(
                      child: Text(
                        'Sanitations include the  public health conditions related to clean drinking water and treatment and disposal of human excreta and sewage.Hence should practice hand washing with soap.',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.5,
                    child: Image.asset(
                      'assets/images/handwash.jpg',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                  const Positioned(
                    bottom: 100,
                    left: 0,
                    right: 0,
                    height: 120,
                    child: Center(
                      child: Text(
                        'Hygiene is very important as helps us to prevent outbreak of diseases,that are caused by the unclean environment,contaminated foods we eat and unsafe drinking water. ',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.circle,
                          size: 12.0,
                          color:
                              _currentPage == index ? Colors.red : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (_currentPage ==
                      2) // Show the button only on the last page
                    SizedBox(
                      width: 200, // Increase the width of the button
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Wash_App(),
                              // builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child: const Text('Get Started'),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
