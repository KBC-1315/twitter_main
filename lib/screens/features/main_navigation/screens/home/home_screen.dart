import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/screens/features/main_navigation/models/post_model.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/home/detail_view_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/post/post_screen.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/home/widgets/image_post_widget.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/home/widgets/text_post_widget.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/post/view_models/fetch_post_view_model.dart';
import 'package:tictok_clone/screens/features/main_navigation/screens/post/view_models/search_post_view_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  Future<List<PostModel>>? _searchResults;
  late Future<List<PostModel>> _initialPosts;

  @override
  void initState() {
    super.initState();
    _initialPosts = getData();
    _searchResults = _initialPosts;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onThreeDotTap() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const DetailViewScreen(),
    );
  }

  void _onNewPostTap() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const PostScreen(),
    );
  }

  void _onSearchTap() {
    final searchString = _searchController.text;
    setState(() {
      _searchResults =
          ref.read(searchPostProvider.notifier).searchPosts(searchString);
    });
  }

  Future<List<PostModel>> getData() async {
    return ref.read(fetchPostProvider.future);
  }

  Future<void> _refreshPosts() async {
    await ref.read(fetchPostProvider.notifier).refreshPosts();
    setState(() {
      _searchResults = ref.read(fetchPostProvider.future);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          labelText: "Search",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.search),
                        ),
                        onSubmitted: (value) {
                          _onSearchTap();
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: _onSearchTap,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refreshPosts,
                  child: FutureBuilder<List<PostModel>>(
                    future: _searchResults,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No posts available'));
                      } else {
                        final posts = snapshot.data!;
                        return ListView.builder(
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            var post = posts[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 16.0,
                              ),
                              child: post.postType == "text"
                                  ? TextPostWidget(post: post)
                                  : ImagePostWidget(post: post),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
