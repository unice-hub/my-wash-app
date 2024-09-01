// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PostModel with ChangeNotifier {
  final List<Map<String, dynamic>> _posts = [];

  List<Map<String, dynamic>> get posts => _posts;

  void addPost(Map<String, dynamic> post) {
    _posts.add(post);
    notifyListeners();
  }
}
