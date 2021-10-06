import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> profileImages = [
    "images/1.jpg",
    "images/2.png",
    "images/3.png",
    "images/4.png",
    "images/5.png",
    "images/6.png",
    "images/7.png",
    "images/8.png",
  ];
  List<String> posts = [
    "images/post_1.jfif",
    "images/post_2.jfif",
    "images/post_3.jfif",
    "images/post_4.jpg",
    "images/post_5.jfif",
    "images/post_6.jpg",
    "images/post_7.jfif",
    "images/post_8.jpg",
  ];
  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/insta_title.png",
          height: 50,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_outline)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: Icon(Icons.chat_bubble_outline))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
            child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  8,
                  (index) => Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage("images/storybackground.png"),
                          child: CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage(profileImages[index]),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Profile Name",
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Column(
              children: List.generate(
                8,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // post
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: CircleAvatar(
                            radius: 14,
                            backgroundImage:
                                AssetImage("images/storybackground.png"),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundImage: AssetImage(profileImages[index]),
                            ),
                          ),
                        ),
                        Text("profile name"),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert),
                        )
                      ],
                    ),
                    //Image po
                    Image.asset(posts[index],
                    height: 300,
                    width: double.maxFinite,
                    fit: BoxFit.cover),

                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.chat_bubble_outline),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.label_outline),
                          onPressed: () {},
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.bookmark_border),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(text: "Liked by"),
                                TextSpan(
                                  text: " profile Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(text: " and"),
                                TextSpan(
                                  text: " others",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "profile Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      " This is the most Amazing pic ever put on Instagram.",
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "View all 13883 comments",
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
