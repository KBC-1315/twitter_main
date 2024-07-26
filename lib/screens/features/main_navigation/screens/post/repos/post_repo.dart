import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/screens/features/main_navigation/models/post_model.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firebase;

class PostRepository {
  final firebase.FirebaseFirestore _db = firebase.FirebaseFirestore.instance;

  Future<void> savePost(PostModel post) async {
    await _db.collection("post").add(post.toJson());
  }

  Future<List<String>> uploadPostFile(
      List<PlatformFile> posts, String id) async {
    List<String> outputList = [];
    final uploadPath = 'public/$id/${DateTime.now().millisecondsSinceEpoch}';
    for (var post in posts) {
      final filePath = '/${post.path!.split("/").last}';
      final resultPath = "$uploadPath$filePath";
      final result = await Amplify.Storage.uploadFile(
        localFile: AWSFile.fromStream(
          post.readStream!,
          size: post.size,
        ),
        path: StoragePath.fromString(resultPath),
        onProgress: (progress) {
          safePrint('fraction totalBytes: ${progress.totalBytes}');
          safePrint('fraction transferredBytes: ${progress.transferredBytes}');
          safePrint('fraction completed: ${progress.fractionCompleted}');
        },
      ).result;
      safePrint('Successfully uploaded file: ${result.uploadedItem.path}');
      outputList.add(resultPath);
    }
    return outputList;
  }

  Future<firebase.QuerySnapshot<Map<String, dynamic>>> fetchPosts() {
    return _db
        .collection("post")
        .orderBy(
          "createdAt",
          descending: true,
        )
        .get();
  }

  Future<List<Map<String, dynamic>>> searchPosts(String searchString) async {
    final querySnapshot = await _db.collection("post").get();
    final filteredDocs = querySnapshot.docs.where((doc) {
      final data = doc.data();
      return data['description'].toString().contains(searchString) ||
          data['creator'].toString().contains(searchString);
    }).toList();

    return filteredDocs.map((doc) => doc.data()).toList();
  }

  Future<List<PostModel>> getDownloadUrl(List<PostModel> models) async {
    List<PostModel> tempPostModels = [];
    for (var model in models) {
      PostModel tempPostModel = model;
      if (model.fileUrl.isNotEmpty) {
        List<String> resultList = [];
        for (var url in model.fileUrl) {
          try {
            final temp =
                await Amplify.Storage.getUrl(path: StoragePath.fromString(url))
                    .result;
            safePrint("Url 받아옴${temp.url.toString()}");
            resultList.add(temp.url.toString());
          } on StorageException catch (e) {
            safePrint(e.message);
          }
        }
        tempPostModel.fileUrl = resultList;
      }
      tempPostModels.add(tempPostModel);
    }
    return tempPostModels;
  }
}

final postRepo = Provider((ref) => PostRepository());
