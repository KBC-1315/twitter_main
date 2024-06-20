import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
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
  ];

  UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.profileImage),
                  ),
                  title: Text(user.name),
                  subtitle: Text('${user.followers} followers'),
                  trailing: TextButton(
                    onPressed: () {},
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

  User(
      {required this.name,
      required this.username,
      required this.followers,
      required this.profileImage});
}
