import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> ProfileImage = [
    "images/m2.jpg",
    "images/m3.jpg",
    "images/m4.jpg",
    "images/m5.jpg",
    "images/m6.jpg",
    "images/m7.jpg",
    "images/m8.jpg",
    "images/m9.jpg",
  ];

  List<String> posts = [
    "images/m10.jpg",
    "images/m12.jpg",
    "images/m13.jpg",
    "images/m14.jpg",
    "images/m15.jpg",
    "images/m16.jpg",
    "images/m17.jpg",
    "images/m18.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/m1_2.png",
          height: 50,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_outline)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: Icon(Icons.chat_bubble_outline)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Story
            SingleChildScrollView(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    8,
                    (index) => Container(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('images/m11.jpg'),
                            child: CircleAvatar(
                              radius: 32,
                              backgroundImage: AssetImage(ProfileImage[index]),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'name',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            Divider(),

            Column(
              children: List.generate(
                8,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //HEADER POST
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: CircleAvatar(
                            radius: 14,

                            backgroundImage: AssetImage('images/m11.jpg'),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundImage: AssetImage(ProfileImage[index]),
                            ),
                          ),
                        ),
                        Text("Name"),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert),
                        )
                      ],
                    ),
                    //POST IMAGE
                    Container(
                      width: 400,
                      height: 200,
                      child: Image.asset(
                        posts[index],
                      fit: BoxFit.fill,
                      ),
                    ),
                    //POST FOOTER
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.chat_bubble_outline)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.label_outlined)),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.bookmark_border)),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(

                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              children: [

                                TextSpan(text: "Liked by"),
                                TextSpan(
                                  text: " Name",
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
