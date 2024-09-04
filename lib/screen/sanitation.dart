// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

import 'Wash_App.dart';



void main() => runApp(const Sanitation());

class Sanitation extends StatelessWidget {
  const Sanitation({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sanitations',
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  late VideoPlayerController _animatedController1;
  late VideoPlayerController _animatedController2;
  late Future<void> _initializeVideoPlayerFuture1;
  late Future<void> _initializeVideoPlayerFuture2;
  late Future<void> _initializeVideoPlayerFuture3;
  late Future<void> _initializeAnimatedVideoPlayerFuture1;
  late Future<void> _initializeAnimatedVideoPlayerFuture2;
  late List<VideoPlayerController> _controllers;
  late List<Future<void>> _initializeVideoPlayerFutures;

  @override
  void initState() {
    super.initState();

    _controller1 = VideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/flutter-application-c92ae.appspot.com/o/Understand%20Goal%206_%20Clean%20Water%20and%20Sanitation%20(Secondary).mp4?alt=media&token=9748561b-9aa2-41fe-a610-3998d74c1377 ',
    );

    _controller2 = VideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/flutter-application-c92ae.appspot.com/o/SDG%206_%20CLEAR%20WATER%20AND%20SANITATION.mp4?alt=media&token=0d8a3bf4-c5cc-4452-9df7-f6358e557515',
    );

    _controller3 = VideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/flutter-application-c92ae.appspot.com/o/Community%20Engagement%20in%20WASH%20(Water%2C%20Sanitation%20%26%20Hygiene)%20%E2%80%93%20how%20it%20works%20in%20practice.(1).mp4?alt=media&token=8b44654a-490a-44fc-b43e-b40de678e322',
    );

    _animatedController1 = VideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/flutter-application-c92ae.appspot.com/o/Water%2C%20sanitation%20%26%20Hygiene%20during%20emergencies.mp4?alt=media&token=332bbe45-fbda-4968-9fee-6d9e7cf8cbd8',
    );

    _animatedController2 = VideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/flutter-application-c92ae.appspot.com/o/Environment%20Sanitation%20Animation.mp4?alt=media&token=a2b83d10-bc32-4212-9de5-220c2cb1e341',
    );

    _initializeVideoPlayerFuture1 = _controller1.initialize();
    _initializeVideoPlayerFuture2 = _controller2.initialize();
    _initializeVideoPlayerFuture3 = _controller3.initialize();
    _initializeAnimatedVideoPlayerFuture1 = _animatedController1.initialize();
    _initializeAnimatedVideoPlayerFuture2 = _animatedController2.initialize();

    _controllers = [
      _controller1,
      _controller2,
      _controller3,
      _animatedController1,
      _animatedController2
    ];
    _initializeVideoPlayerFutures = [
      _initializeVideoPlayerFuture1,
      _initializeVideoPlayerFuture2,
      _initializeVideoPlayerFuture3,
      _initializeAnimatedVideoPlayerFuture1,
      _initializeAnimatedVideoPlayerFuture2
    ];

    for (var controller in _controllers) {
      controller.setLooping(true);
      controller.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildVideoPlayer(int index, String description, String title) {
    return FutureBuilder(
      future: _initializeVideoPlayerFutures[index],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          bool isPlaying = _controllers[index].value.isPlaying;
          return Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: _controllers[index].value.aspectRatio,
                child: VideoPlayer(_controllers[index]),
              ),
              Positioned(
                top: 16.0,
                left: 16.0,
                right: 16.0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              if (!isPlaying)
                Positioned(
                  top: 8.0,
                  left: 16.0,
                  right: 16.0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.black.withOpacity(0.5),
                    child: Text(
                      description,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),

              //this is the play button at the center
              // if (!isPlaying)
              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       IconButton(
              //         icon: const Icon(Icons.skip_previous, color: Colors.white),
              //         onPressed: () {
              //           if (index > 0) {
              //             setState(() {
              //               _controllers[index].pause();
              //               _controllers[index - 1].play();
              //             });
              //           }
              //         },
              //       ),
              //       FloatingActionButton(
              //         onPressed: () {
              //           setState(() {
              //             _controllers[index].play();
              //           });
              //         },
              //         child: const Icon(Icons.play_arrow),
              //       ),
              //       IconButton(
              //         icon: const Icon(Icons.skip_next, color: Colors.white),
              //         onPressed: () {
              //           if (index < _controllers.length - 1) {
              //             setState(() {
              //               _controllers[index].pause();
              //               _controllers[index + 1].play();
              //             });
              //           }
              //         },
              //       ),
              //     ],
              //   ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Column(
                  children: [
                    VideoProgressIndicator(_controllers[index],
                        allowScrubbing: true),

                    //volume
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(_controllers[index].value.volume > 0
                              ? Icons.volume_up
                              : Icons.volume_off),
                          onPressed: () {
                            setState(() {
                              if (_controllers[index].value.volume > 0) {
                                _controllers[index].setVolume(0);
                              } else {
                                _controllers[index].setVolume(1);
                              }
                            });
                          },
                        ),

                        //play or pause button at the buttom
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                _controllers[index].value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (_controllers[index].value.isPlaying) {
                                    _controllers[index].pause();
                                  } else {
                                    _controllers[index].play();
                                  }
                                });
                              },
                            ),

                            //duration of the video
                            Text(
                              '${_controllers[index].value.position.inMinutes}:${(_controllers[index].value.position.inSeconds % 60).toString().padLeft(2, '0')} / ${_controllers[index].value.duration.inMinutes}:${(_controllers[index].value.duration.inSeconds % 60).toString().padLeft(2, '0')}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 243, 148, 148)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contents'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Wash_App(),
                ),
              );
            },
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView(
          children: [
            ExpansionTile(
              title: const Text('Videos'),
              children: [
                _buildVideoPlayer(
                    0,
                    ' Introduction to sanitation',
                    ''),
                Container(
                    height: 10,
                    color: Colors
                        .black), // Adjust the height value as needed for spacing

                _buildVideoPlayer(
                    1,
                    'Understanding goals to clean water and sanitation',
                    ''),
                Container(
                    height: 10,
                    color: Colors
                        .black), // Adjust the height value as needed for spacing

                _buildVideoPlayer(
                    2,
                    'Behavior analysis to improve WASH practices',
                    ''),
                Container(height: 10, color: Colors.black),
              ],
            ),
            // ExpansionTile(
            //   title: const Text('Stories'),
            //   children: [
            //     ListTile(
            //       title: const Text('Story 1'),
            //       subtitle: const Text('This is the first example story.'),
            //       onTap: () {
            //         // Handle tap on Story 1
            //       },
            //     ),
            //     ListTile(
            //       title: const Text('Story 2'),
            //       subtitle: const Text('This is the second example story.'),
            //       onTap: () {
            //         // Handle tap on Story 2
            //       },
            //     ),
            //   ],
            // ),
            ExpansionTile(
              title: const Text('Animated Videos'),
              children: [
                _buildVideoPlayer(
                    3, 'WASH knowledge during emergencies', ''),
                Container(height: 10, color: Colors.black),
                _buildVideoPlayer(
                    4, 'Environment sanitation', ''),
                Container(height: 10, color: Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FullscreenVideoPlayerPage extends StatelessWidget {
  final VideoPlayerController controller;

  const FullscreenVideoPlayerPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VideoPlayerScreen(),
            ),
          );
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}
