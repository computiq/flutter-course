import 'package:flutter/material.dart';
import 'instagram_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...postContent.map((val) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(val.userImage),
                        ),
                      ),
                      Text(
                        val.userName,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Image.network(
                    val.postImage,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline),
                        color: Colors.white,
                        iconSize: 45,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.location_on_outlined),
                        color: Colors.white,
                        iconSize: 45,
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                        color: Colors.white,
                        iconSize: 45,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 16.0),
                    child: Text(
                      '${val.likes} Likes',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
