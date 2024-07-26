import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/screens/features/main_navigation/models/post_model.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/post/repos/post_repo.dart';

class FetchPostViewModel extends AsyncNotifier<List<PostModel>> {
  List<PostModel> _list = [];

  @override
  FutureOr<List<PostModel>> build() async {
    return await _fetchPosts();
  }

  Future<List<PostModel>> _fetchPosts() async {
    final PostRepository postrepository = ref.read(postRepo);
    final result = await postrepository.fetchPosts();
    final newResult = result.docs.map(
      (doc) => PostModel.fromJson(
        doc.data(),
      ),
    );
    _list = newResult.toList();
    final finallist = await postrepository.getDownloadUrl(_list);
    return finallist;
  }

  Future<void> refreshPosts() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _fetchPosts();
    });
  }
}

final fetchPostProvider =
    AsyncNotifierProvider<FetchPostViewModel, List<PostModel>>(
        () => FetchPostViewModel());
