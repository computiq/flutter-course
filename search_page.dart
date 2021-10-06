import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> buttons = [
        "IGTV",
        "Travel",
        "Architecture",
        "Decor",
        "Style",
        "Food",
        "Art",
        "Beauty",
        "DIY",
        "Music",
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
    "images/post_9.jfif",
    "images/post_9jpg.jpg",
    "images/post_10.jpg",
    "images/post_11.jpg",
    "images/post_12.jfif",
    "images/1.jpg",
    "images/2.png",
    "images/3.png",
    "images/4.png",
    "images/5.png",
    "images/6.png",
    "images/7.png",
    "images/8.png",
    
  ];
  
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              primary: false,
              title: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  contentPadding: EdgeInsets.all(0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Color.fromARGB(40, 77, 40, 1),
                  filled: true,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.person_add),
                ),
              ],
            ),
            SliverAppBar(
              titleSpacing: 0,
              primary: false,
              pinned: true,
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    10,
                     (index) => Container(
                       padding: EdgeInsets.symmetric(horizontal: 5),
                       child: OutlineButton(onPressed: (){},
                       child: Text(
                         buttons[index],
                       ),
                       ),
                     ),
                     ),
                     ),
              ),
            ),
            SliverList(delegate: SliverChildListDelegate(
              [
                GridView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: 20,
                physics: ScrollPhysics(parent: null),
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
               itemBuilder: (context,index) => Container(
                 padding: EdgeInsets.all(2),
                 child: Image.asset(posts[index],fit: BoxFit.cover,),
               )
                ),
              ],
              ),
              ),
          ],
        ),
      ),
    );
  }
}
