import 'dart:async';
import 'dart:io';

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

  Future<void> uploadPost(File post, BuildContext context) async {
    final user = ref.read(authRepo).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final task = await _repository.uploadPostFile(
          post,
          user!.uid,
        );
        if (task.metadata != null) {
          await _repository.savePost(
            PostModel(
              creator: "Anonymous",
              description: "temp",
              fileUrl: await task.ref.getDownloadURL(),
              likes: 0,
              comments: 0,
              creatorUid: user.uid,
              createdAt: DateTime.now().millisecondsSinceEpoch,
            ),
          );
        }
      },
    );
  }
}

final uploadPostProvider = AsyncNotifierProvider<UploadPostViewModel, void>(
  () => UploadPostViewModel(),
);
