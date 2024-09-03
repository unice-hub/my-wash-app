import 'dart:async';
import 'package:flutter/material.dart';
import 'hygiene.dart';
import 'sanitation.dart';
import 'water.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _verticalScrollController = ScrollController();
  int currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        currentIndex = (_scrollController.offset / 370)
            .round(); // 370 is the width + margin of the container
      });
    });
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _verticalScrollController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_scrollController.hasClients) {
        double maxScrollExtent = _scrollController.position.maxScrollExtent;
        double newOffset = _scrollController.offset +
            370.0; // 370 is the width + margin of the container
        if (newOffset > maxScrollExtent) {
          newOffset = 0.0;
        }
        _scrollController.animateTo(
          newOffset,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 700, // height of the container
        // width: 300,
        color: const Color.fromARGB(255, 149, 201, 243), // background color here
        child: Padding(
          padding: const EdgeInsets.all(32.0),  //adjust space btn the container and the tabbar view
          child: SingleChildScrollView(
            controller: _verticalScrollController,
            child: Column(
              children: [
                const SizedBox(height: 10),
                SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(6, (index) {
                      var contentList = [
                        {
                          'text': 'participating in WASH related community activity',
                          'imagePath': 'assets/images/cleanenviro.jpg'
                        },
                        {
                          'text': 'Cleaning the environment',
                          'imagePath': 'assets/images/sweep.jpg'
                        },
                        {
                          'text':
                              'Parents teaching and encourage the young generation on hygiene',
                          'imagePath': 'assets/images/parents teaching child.jpg'
                        },
                        {
                          'text':
                              'Performing water treatment to have safe and clean water to use',
                          'imagePath': 'assets/images/water treatment.jpg'
                        },
                        {
                          'text':
                              'Members of the community participate in cleanliness',
                          'imagePath': 'assets/images/sanityby ppl.jpg'
                        },
                        {
                          'text': 'Practicing sanitation and hygiene',
                          'imagePath': 'assets/images/handwash.jpg'
                        },
                      ];

                      return Container(
                        margin: const EdgeInsets.all(10.0),
                        width: 350.0,
                        height: 150.0,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 212, 218, 212)
                              .withOpacity(0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                contentList[index]['text']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Image.asset(
                              contentList[index]['imagePath']!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == index ? Colors.blue : Colors.grey,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Water(),
                          ),
                        );
                      },
                  
                      child: Container(
                        width: 150.0,
                        height: 120.0,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 108, 182, 243),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.water_drop_outlined, size: 20, color: Colors.black),
                            SizedBox(height: 10),
                            Text('Water',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Sanitation(),
                          ),
                        );
                      },
                      child: Container(
                        width: 150.0,
                        height: 120.0,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 103, 241, 149),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cleaning_services, size: 20, color: Colors.black),
                            SizedBox(height: 10),
                            Text('Sanitation',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Hygiene(),
                          ),
                        );
                      },
                      child: Container(
                        width: 150.0,
                        height: 120.0,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 241, 113, 81),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.health_and_safety, size: 20, color: Colors.black),
                            SizedBox(height: 10),
                            Text('Hygiene',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
