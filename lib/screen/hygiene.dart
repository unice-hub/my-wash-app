// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';
import 'Wash_App.dart';

void main() => runApp(const Hygiene());

class Hygiene extends StatelessWidget {
  const Hygiene({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hygiene',
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
      'https://firebasestorage.googleapis.com/v0/b/flutter-application-c92ae.appspot.com/o/PERSONAL%20HYGIENE.mp4?alt=media&token=1252850b-8381-4239-8ba9-d0c3c305be03',
    );

    _controller2 = VideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/flutter-application-c92ae.appspot.com/o/Water%20Sanitation%20and%20Hygiene%20-%20WASH%20in%20Public%20Health.mp4?alt=media&token=ae061139-f167-4a1c-9043-1e8470f6d366',
    );

    _controller3 = VideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/flutter-application-c92ae.appspot.com/o/Using%20behaviour%20analysis%20to%20improve%20water%2C%20sanitation%20and%20hygiene%20practices.mp4?alt=media&token=4a2e133f-703b-4e17-9685-efa47337ab67',
    );

    _animatedController1 = VideoPlayerController.network(
      'https://firebasestorage.googleapis.com/v0/b/flutter-application-c92ae.appspot.com/o/Kutunza%20Mazingira%20na%20Ubongo%20Kids%20_%20Siku%20Ya%20Mazingira%20Duniani.mp4?alt=media&token=3b6c1059-07e4-4c43-a37c-f0fa9aeca81a',
    );

    // _animatedController2 = VideoPlayerController.network(
    //   '',
    // );

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

                    //the volume button
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

                        //the play or pause button at the bottom
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

                            //the duration of video
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
                _buildVideoPlayer(0,' Introduction to Hygiene' ,
                    ''),
                Container(
                    height: 10,
                    color: Colors
                        .black), // Adjust the height value as needed for spacing

                _buildVideoPlayer(1,'WASH to public healthy',
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
                //   title: const Text('Story 2'),
                //   subtitle: const Text('This is the second example story.'),
                //   onTap: () {
                //     // Handle tap on Story 2
                //   },
            //     // ),
            //   ],
            // ),
            ExpansionTile(
              title: const Text('Animated Videos'),
              children: [
                _buildVideoPlayer(
                    3, 'Akili and friends cleaning environment', ''),
                Container(height: 10, color: Colors.black),
                // _buildVideoPlayer(
                //     4, '', 'Animated Video 2'),
                // Container(height: 10, color: Colors.black),
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
