import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeamList {
  String username;
  String userimage;
  String postimage;
  bool isLiked = false;
  TeamList(
      {required this.username,
      required this.userimage,
      required this.postimage,
      required this.isLiked});
}

List<TeamList> members = [
  TeamList(
      username: 'zayn_n97',
      userimage: 'https://avatars.githubusercontent.com/u/38259126?v=4',
      postimage:
          'https://images.unsplash.com/photo-1433832597046-4f10e10ac764?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1942&q=80',
      isLiked: false),
  TeamList(
      username: 'bluemix',
      userimage: 'https://avatars.githubusercontent.com/u/3332274?v=4',
      postimage:
          'https://images.unsplash.com/photo-1628800491886-feba18ba54f0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=735&q=80',
      isLiked: true),
  TeamList(
      username: 'de_grandi',
      userimage:
          'https://images.unsplash.com/profile-1510508149334-1afd6f4775e4?dpr=1&auto=format&fit=crop&w=150&h=150&q=60&crop=faces&bg=fff',
      postimage:
          'https://images.unsplash.com/photo-1510525009512-ad7fc13eefab?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1974&q=80',
      isLiked: true),
  TeamList(
      username: 'karsten116',
      userimage:
          'https://images.unsplash.com/profile-1583427783052-3da8ceab5579image?dpr=1&auto=format&fit=crop&w=150&h=150&q=60&crop=faces&bg=fff',
      postimage:
          'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=764&q=80',
      isLiked: false),
];

Widget buildTeamList() {
  return ListView.builder(
    itemCount: members.length,
    itemBuilder: (_context, index) {
      return buildTeamItem(members[index]);
    },
  );
}

Widget buildTeamItem(TeamList member) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 22.0,
                  backgroundImage: NetworkImage(member.userimage),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  member.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Image.network(member.postimage),
            const SizedBox(height: 15),
            Row(
              children: [
                Icon(
                  member.isLiked
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: member.isLiked ? Colors.redAccent : Colors.black,
                  size: 27,
                ),
                const SizedBox(width: 10),
                const Icon(
                  FontAwesomeIcons.commentAlt,
                  size: 27,
                ),
                const SizedBox(width: 10),
                const Icon(
                  FontAwesomeIcons.paperPlane,
                  size: 27,
                ),
                Expanded(child: Container()),
                const Icon(
                  FontAwesomeIcons.bookmark,
                  size: 27,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text('20 Likes',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                )),
          ],
        ),
      ),
    ),
  );
}
