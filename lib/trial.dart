import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  final List<Map<String, dynamic>> posts = [
    {
      'user': 'User1',
      'avatar': 'assets/images/sanitation_veg.jpg',
      'image': 'assets/images/washimage.jpg',
      'text': 'This is the first post',
      'likes': 0,
      'comments': [],
    },
    // ... other posts
  ];
  
  int index = 0;

  void _toggleLike(int index) {
    setState(() {
      if (posts[index]['liked']) {
        posts[index]['likes']--;
      } else {
        posts[index]['likes']++;
      }
      posts[index]['liked'] = !posts[index]['liked'];
    });
  }

  void _addComment(int index, String comment) {
    setState(() {
      posts[index]['comments'].add(comment);
    });
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
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(posts[index]['avatar']),
                ),
                title: Text(posts[index]['user']),
                subtitle: Text(posts[index]['text']),
              ),
              Image.asset(posts[index]['image']),
            ],
          );
        },
      ),
      bottomNavigationBar: Builder(
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    posts[index]['liked'] ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () => _toggleLike(index),
                ),
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
              ],
            ),
          );
        },
      ),
    );
  }
}



// Row(
//                 children: <Widget>[
//                   IconButton(
//                     icon: const Icon(Icons.favorite_border),
//                     color: Colors.red,
//                     onPressed: () => _toogleLike(index),
//                   ),
//                   Text('${posts[index]['likes']} likes'),
//                   IconButton(
//                     icon: const Icon(Icons.comment),
//                     onPressed: () {
//                       // Show dialog to add comment
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           String comment = '';
//                           return AlertDialog(
//                             title: const Text('Add a comment'),
//                             content: TextField(
//                               onChanged: (value) {
//                                 comment = value;
//                               },
//                             ),
//                             actions: <Widget>[
//                               ElevatedButton(
//                                 child: const Text('Post'),
//                                 onPressed: () {
//                                   _addComment(index, comment);
//                                   Navigator.of(context).pop();
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   ),
//                   Text('${posts[index]['comments'].length} comments'),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () {
//           // Navigate to a new screen to add a post
//         },
//       ),
//     );
//   }
// }