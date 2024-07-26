import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/screens/features/main_navigation/models/post_model.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/post/repos/post_repo.dart';

class SearchPostViewModel extends AsyncNotifier<List<PostModel>> {
  List<PostModel> _list = [];

  @override
  FutureOr<List<PostModel>> build() async {
    final PostRepository postRepository = ref.read(postRepo);
    final result = await postRepository.fetchPosts();
    final newResult = result.docs.map(
      (doc) => PostModel.fromJson(
        doc.data(),
      ),
    );
    _list = newResult.toList();
    final finalList = await postRepository.getDownloadUrl(_list);
    return finalList;
  }

  Future<List<PostModel>> searchPosts(String searchString) async {
    final PostRepository postRepository = ref.read(postRepo);
    final result = await postRepository.searchPosts(searchString);
    final newResult = result.map(
      (data) => PostModel.fromJson(data),
    );
    _list = newResult.toList();
    final finalList = await postRepository.getDownloadUrl(_list);
    return finalList;
  }
}

final searchPostProvider =
    AsyncNotifierProvider<SearchPostViewModel, List<PostModel>>(
        () => SearchPostViewModel());
