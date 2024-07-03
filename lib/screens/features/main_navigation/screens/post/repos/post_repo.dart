import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/screens/features/main_navigation/models/post_model.dart';

class PostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  UploadTask uploadPostFile(File post, String uid) {
    final fileRef = _storage.ref().child(
        "/post/$uid/${DateTime.now().millisecondsSinceEpoch.toString()}");
    print("Start Upload");
    print(post);
    print(post.path);

    return fileRef.putFile(post);
  }

  // create a post document
  Future<void> savePost(PostModel post) async {
    await _db.collection("post").add(post.toJson());
  }
}

final postRepo = Provider((ref) => PostRepository());
