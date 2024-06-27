import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<User> users = [
    User(
        name: 'Mithun',
        username: 'rjmithun',
        followers: '26.6K',
        profileImage: 'https://via.placeholder.com/100'),
    User(
        name: 'VICE News',
        username: 'vicenews',
        followers: '301K',
        profileImage: 'https://via.placeholder.com/100'),
    User(
        name: 'Trevor Noah',
        username: 'trevornoah',
        followers: '789K',
        profileImage: 'https://via.placeholder.com/100'),
    User(
        name: 'Condé Nast Traveller',
        username: 'condenasttraveller',
        followers: '130K',
        profileImage: 'https://via.placeholder.com/100'),
    User(
        name: 'Suresh Pillai',
        username: 'chef_pillai',
        followers: '69.2K',
        profileImage: 'https://via.placeholder.com/100'),
    User(
        name: 'Malala Yousafzai',
        username: 'malala',
        followers: '237K',
        profileImage: 'https://via.placeholder.com/100'),
    User(
        name: 'Fishing_freaks',
        username: 'sebin_cyriac',
        followers: '53.2K',
        profileImage: 'https://via.placeholder.com/100'),
    User(
        name: 'Mithun',
        username: 'rjmithun',
        followers: '26.6K',
        profileImage: 'https://via.placeholder.com/100'),
    User(
        name: 'VICE News',
        username: 'vicenews',
        followers: '301K',
        profileImage: 'https://via.placeholder.com/100'),
    User(
        name: 'Trevor Noah',
        username: 'trevornoah',
        followers: '789K',
        profileImage: 'https://via.placeholder.com/100'),
    User(
        name: 'Condé Nast Traveller',
        username: 'condenasttraveller',
        followers: '130K',
        profileImage: 'https://via.placeholder.com/100'),
    User(
        name: 'Suresh Pillai',
        username: 'chef_pillai',
        followers: '69.2K',
        profileImage: 'https://via.placeholder.com/100'),
    User(
        name: 'Malala Yousafzai',
        username: 'malala',
        followers: '237K',
        profileImage: 'https://via.placeholder.com/100'),
    User(
        name: 'Fishing_freaks',
        username: 'sebin_cyriac',
        followers: '53.2K',
        profileImage: 'https://via.placeholder.com/100'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.profileImage),
                    radius: 25,
                  ),
                  title: Row(
                    children: [
                      Text(
                        user.username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: 16,
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '${user.followers} followers',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  trailing: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: const Text('Follow'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  final String name;
  final String username;
  final String followers;
  final String profileImage;

  User({
    required this.name,
    required this.username,
    required this.followers,
    required this.profileImage,
  });
}
