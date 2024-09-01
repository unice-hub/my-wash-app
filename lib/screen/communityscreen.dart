// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  List<Map<String, dynamic>> posts = [
    {
      'user': 'User1',
      'avatar': 'assets/images/washimage.jpg',
      'image': 'assets/images/washimage.jpg',
      'text': 'This is the first post',
      'likes': 0,
      'comments': [],
    },
    // Other posts...
  ];

  void _likePost(int index) {
    setState(() {
      posts[index]['likes']++;
    });
  }

  void _addComment(int index, String comment) {
    if (comment.isNotEmpty) {
      setState(() {
        posts[index]['comments'].add(comment);
      });
    }
  }

  void _deletePost(int index) {
    setState(() {
      posts.removeAt(index);
    });
  }

  void _addPost(String user, String avatar, String image, String text) {
    if (text.isNotEmpty && image.isNotEmpty) {
      setState(() {
        posts.insert(0, {
          'user': user,
          'avatar': avatar,
          'image': image,
          'text': text,
          'likes': 0,
          'comments': [],
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(posts[index]['avatar']),
                ),
                title: Text(posts[index]['user']),
                subtitle: Text(posts[index]['text']),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deletePost(index),
                ),
              ),
              Image.asset(posts[index]['image']),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () => _likePost(index),
                    ),
                    Text('${posts[index]['likes']}'),
                    IconButton(
                      icon: const Icon(Icons.comment),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            String comment = '';
                            return AlertDialog(
                              title: const Text('Add a comment'),
                              content: TextField(
                                onChanged: (value) {
                                  comment = value;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Enter your comment here',
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Post'),
                                  onPressed: () {
                                    _addComment(index, comment);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    Text('${posts[index]['comments'].length} '),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  posts[index]['comments'].length,
                  (commentIndex) {
                    return ListTile(
                      title: Text(posts[index]['comments'][commentIndex]),
                    );
                  },
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPostScreen(addPost: _addPost),
            ),
          );
        },
      ),
    );
  }
}

class NewPostScreen extends StatefulWidget {
  final Function(String, String, String, String) addPost;
  const NewPostScreen({required this.addPost, super.key});

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  String description = '';
  String selectedImage = '';
  String user = 'User2';
  String avatar = 'assets/images/clean.jpg';

  List<String> contents = [
    'handwash.jpg',
    'mancleaning.jpg',
    'sweep.jpg',
    'wash.jpg',
    'waterkids.jpg',
    // Add more file names...
  ];

  String selectedContent = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: selectedImage.isNotEmpty
                  ? Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Image.asset(selectedImage),
                    )
                  : GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Select Image'),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: contents.map((image) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: ListTile(
                                        leading: Image.asset(
                                            'assets/images/$image'),
                                        title: Text(image),
                                        onTap: () {
                                          setState(() {
                                            selectedImage =
                                                'assets/images/$image';
                                            selectedContent = image;
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text(selectedContent.isNotEmpty
                              ? selectedContent
                              : 'Tap to select image'),
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (selectedImage.isNotEmpty && description.isNotEmpty) {
                  widget.addPost(user, avatar, selectedImage, description);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                }
              },
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Community(),
  ));
}
