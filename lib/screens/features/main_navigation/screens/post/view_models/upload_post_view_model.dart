import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/screens/authentication/repos/authentication_repository.dart';
import 'package:tictok_clone/screens/features/main_navigation/models/post_model.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/post/repos/post_repo.dart';

class UploadPostViewModel extends AsyncNotifier<void> {
  late final PostRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.read(postRepo);
  }

  Future<void> uploadPost(
      List<PlatformFile>? post, BuildContext context, String text) async {
    final user = ref.read(authRepo).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (post == null) {
        await _repository.savePost(
          PostModel(
            postType: "text",
            creator: "anon",
            description: text,
            fileUrl: [],
            likes: 0,
            comments: 0,
            creatorUid: user!.uid,
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
      } else {
        final url = await _repository.uploadPostFile(post, user!.uid);
        //if (task.metadata != null) {
        await _repository.savePost(
          PostModel(
            postType: (url.isEmpty) ? "text" : "image",
            creator: "anon",
            description: text,
            fileUrl: url,
            likes: 0,
            comments: 0,
            creatorUid: user.uid,
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
      }
    }
        //},
        );
  }
}

final uploadPostProvider = AsyncNotifierProvider<UploadPostViewModel, void>(
  () => UploadPostViewModel(),
);
