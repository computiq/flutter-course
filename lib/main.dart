import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Go to my profile',
      style: optionStyle,
    ),
    Text(
      'Go to my profile ',
      style: optionStyle,
    ),
    personal(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROrrA84D8J5d1acgBQnJdoEAraPu0Igriw1g&usqp=CAU',
                    height: 35,
                  ),
                  SizedBox(width: 500),
                  Image.network(
                    'https://cdn3.iconfinder.com/data/icons/instagram-18/512/199_Instagram_Plus_Sets_Upload-512.png',
                    height: 35,
                  ),
                  //SizedBox(width: 100),
                  Image.network(
                    'https://st2.depositphotos.com/38069286/42112/v/600/depositphotos_421121214-stock-illustration-direct-messages-button-icon-isolated.jpg',
                    height: 60,
                  ),
                ],
              ),
            ],
          )),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
              ),
              label: 'Post',
              activeIcon: Icon(
                Icons.search_outlined,
              )),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://static.vecteezy.com/system/resources/previews/001/912/726/non_2x/beautiful-woman-in-frame-circular-avatar-character-free-vector.jpg'),
            ),

            activeIcon: CircleAvatar(
              radius: 33,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://static.vecteezy.com/system/resources/previews/001/912/726/non_2x/beautiful-woman-in-frame-circular-avatar-character-free-vector.jpg',
                    ),
                  )),
            ),
            label: 'Personal profile',
            //backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
        iconSize: 40.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

Widget HomeScreen() {
  return SingleChildScrollView(
    child: Column(children: <Widget>[
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 3.0, left: 16.0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      'https://static.vecteezy.com/system/resources/previews/001/912/726/non_2x/beautiful-woman-in-frame-circular-avatar-character-free-vector.jpg'),
                ),
                Positioned(
                    right: -0.2,
                    bottom: -0.2,
                    child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add_circle_outlined,
                          color: Colors.blue,
                        ))),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 16.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://static.vecteezy.com/system/resources/previews/002/603/683/non_2x/mother-day-mom-character-block-and-flat-style-icon-free-vector.jpg'),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 16.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://cdn5.vectorstock.com/i/1000x1000/50/29/avatar-icon-of-girl-in-a-wide-brim-felt-hat-vector-16225029.jpg'),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 16.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://static.vecteezy.com/system/resources/previews/002/002/257/non_2x/beautiful-woman-avatar-character-icon-free-vector.jpg'),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 16.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://cdn5.vectorstock.com/i/1000x1000/13/89/cartoon-avatar-woman-front-view-vector-9421389.jpg'),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 16.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://image.freepik.com/free-vector/smiling-girl-avatar_102172-32.jpg'),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 16.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://cdn.vox-cdn.com/thumbor/MPkildnEorylZbEWbx48GuLmvW0=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22541126/friends1.jpg'),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 16.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://image.shutterstock.com/image-vector/portrait-beautiful-woman-halfturn-avatar-260nw-1828327529.jpg'),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 16.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTex6bwWp4_-rgdVmm7NCyL01rb9OWaDUKMPKV03xNvJsqVfGs1Y1TVFPke3VwGVskinbA&usqp=CAU'),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 16.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/77/b8/32/77b832e7293d48acf9004d5cf6d64396.jpg'),
                  ),
                ],
              )),
          /*
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 100,
              child:
                  Center(child: Text('mariAnn', overflow: TextOverflow.ellipsis)),
            ),
          )
          */
        ]),
      ),
      Divider(),
      //posts
      Column(
        children: <Widget>[
          Post('worood1_', 'Baghadad', 100),
          Post1('Jawaher_28', 'Mosul', 120),
          Post3('roselinda707', 'Hilla', 100),
          Post4('jana.3s', 'hilla', 200),
          Post5('o_meka_p', 'Baghdad', 150),
          Post6('alquds.ahmed', 'Duhok', 100),
          Post7('ruqaiax', 'Anbar', 110),
          Post8('hamas', 'Baghdad', 150),
        ],
      )
    ]),
  );
}

Widget Post(name, location, like) {
  return Column(
    children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 3),
              child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://images.pexels.com/videos/7346487/20-25-years-old-woman-abstract-african-american-girl-afro-7346487.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  location,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.more_vert,
          ),
        )
      ]),
      SizedBox(
        height: 7,
      ),
      Column(
        children: [
          Image(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1533003505519-6a9b92ed4911?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80')),
        ],
      ),
      Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 2.0, top: 3.0),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 45,
            ),
          ),
          //Icon(Icons.speaker_notes_outlined),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.mode_comment_outlined,
              size: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.near_me_outlined,
              size: 45,
            ),
          ),
          SizedBox(
            width: 600,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0, right: 2.0),
            child: Icon(Icons.bookmark_outline_sharp, size: 45),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0, top: 3.0),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              '$like likes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Text(
              '$name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Text(
              'Add a comment ...',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            Text(
              '3 days ago',
              style: TextStyle(fontSize: 10, color: Colors.black54),
            )
          ],
        ),
      )
    ],
  );
}

////////////////////////////////////////////////////////
Widget Post1(name, location, like) {
  return Column(
    children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Row(
          children: <Widget>[
            // hasStory ? smallProfileWithStory() : smallProfileWithoutStory()
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 3),
              child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/002/603/683/non_2x/mother-day-mom-character-block-and-flat-style-icon-free-vector.jpg',
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  location,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.more_vert,
          ),
        )
      ]),
      SizedBox(
        height: 7,
      ),
      Column(
        children: [
          Image(
            image: NetworkImage(
                'https://fashionista.com/.image/t_share/MTU0MjIxNDI1NDM4MjM4MDMy/versace-fur-free.jpg'),
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 2.0, top: 3.0),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 45,
            ),
          ),
          //Icon(Icons.speaker_notes_outlined),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.mode_comment_outlined,
              size: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.near_me_outlined,
              size: 45,
            ),
          ),
          SizedBox(
            width: 600,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0, right: 2.0),
            child: Icon(Icons.bookmark_outline_sharp, size: 45),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0, top: 3.0),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              '$like likes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Text(
              '$name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Text(
              'Add a comment ...',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            Text(
              '3 days ago',
              style: TextStyle(fontSize: 10, color: Colors.black54),
            )
          ],
        ),
      )
    ],
  );
}

///////////////////////////////////////////////////////////
///
Widget Post3(name, location, like) {
  return Column(
    children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Row(
          children: <Widget>[
            // hasStory ? smallProfileWithStory() : smallProfileWithoutStory()
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 3),
              child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTex6bwWp4_-rgdVmm7NCyL01rb9OWaDUKMPKV03xNvJsqVfGs1Y1TVFPke3VwGVskinbA&usqp=CAU',
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  location,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.more_vert,
          ),
        )
      ]),
      SizedBox(
        height: 7,
      ),
      Column(
        children: [
          Image(
            image: NetworkImage(
                'https://thumbs.dreamstime.com/b/aesthetic-background-beach-222938985.jpg'),
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 2.0, top: 3.0),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 45,
            ),
          ),
          //Icon(Icons.speaker_notes_outlined),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.mode_comment_outlined,
              size: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.near_me_outlined,
              size: 45,
            ),
          ),
          SizedBox(
            width: 600,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0, right: 2.0),
            child: Icon(Icons.bookmark_outline_sharp, size: 45),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0, top: 3.0),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              '$like likes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Text(
              '$name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Text(
              'Add a comment ...',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            Text(
              '2 days ago',
              style: TextStyle(fontSize: 10, color: Colors.black54),
            )
          ],
        ),
      )
    ],
  );
}

////////////////////////////////////////////////////
Widget Post4(name, location, like) {
  return Column(
    children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Row(
          children: <Widget>[
            // hasStory ? smallProfileWithStory() : smallProfileWithoutStory()
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 3),
              child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/originals/77/b8/32/77b832e7293d48acf9004d5cf6d64396.jpg',
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  location,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.more_vert,
          ),
        )
      ]),
      SizedBox(
        height: 7,
      ),
      Column(
        children: [
          Image(
            image: NetworkImage(
                'https://purewows3.imgix.net/images/articles/2019_11/friends-thankgiving-episodes-400.jpg?auto=format,compress&cs=strip'),
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 2.0, top: 3.0),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 45,
            ),
          ),
          //Icon(Icons.speaker_notes_outlined),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.mode_comment_outlined,
              size: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.near_me_outlined,
              size: 45,
            ),
          ),
          SizedBox(
            width: 600,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0, right: 2.0),
            child: Icon(Icons.bookmark_outline_sharp, size: 45),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0, top: 3.0),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              '$like likes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Text(
              '$name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Text(
              'Add a comment ...',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            Text(
              '3 days ago',
              style: TextStyle(fontSize: 10, color: Colors.black54),
            )
          ],
        ),
      )
    ],
  );
}

////////////////////////////////////////////////////
///
Widget Post5(name, location, like) {
  return Column(
    children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Row(
          children: <Widget>[
            // hasStory ? smallProfileWithStory() : smallProfileWithoutStory()
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 3),
              child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTIAzHQ0qFo6a2Wr1kEyCvCFGBrrL5rtULQA&usqp=CAU',
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  location,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.more_vert,
          ),
        )
      ]),
      SizedBox(
        height: 7,
      ),
      Column(
        children: [
          Image(
            image: NetworkImage(
                'https://st3.depositphotos.com/8163870/18594/v/380/depositphotos_185943826-stock-illustration-modern-geometric-greek-seamless-pattern.jpg'),
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 2.0, top: 3.0),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.mode_comment_outlined,
              size: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.near_me_outlined,
              size: 45,
            ),
          ),
          SizedBox(
            width: 600,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0, right: 2.0),
            child: Icon(Icons.bookmark_outline_sharp, size: 45),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0, top: 3.0),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              '$like likes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Text(
              '$name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Text(
              'Add a comment ...',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            Text(
              '3 days ago',
              style: TextStyle(fontSize: 10, color: Colors.black54),
            )
          ],
        ),
      )
    ],
  );
}

///////////////////////////////////////////////
///
Widget Post6(name, location, like) {
  return Column(
    children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Row(
          children: <Widget>[
            // hasStory ? smallProfileWithStory() : smallProfileWithoutStory()
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 3),
              child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/194/194938.png',
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  location,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.more_vert,
          ),
        )
      ]),
      SizedBox(
        height: 7,
      ),
      Column(
        children: [
          Image(
            image: NetworkImage('https://i.imgflip.com/55cw4k.jpg'),
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 2.0, top: 3.0),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.mode_comment_outlined,
              size: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.near_me_outlined,
              size: 45,
            ),
          ),
          SizedBox(
            width: 600,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0, right: 2.0),
            child: Icon(Icons.bookmark_outline_sharp, size: 45),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0, top: 3.0),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              '$like likes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Text(
              '$name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Text(
              'Add a comment ...',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            Text(
              '3 days ago',
              style: TextStyle(fontSize: 10, color: Colors.black54),
            )
          ],
        ),
      )
    ],
  );
}

//////////////////////////////////////////////////
///
Widget Post7(name, location, like) {
  return Column(
    children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 3),
              child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://image.shutterstock.com/image-vector/portrait-beautiful-woman-halfturn-avatar-260nw-1828327529.jpg',
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  location,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.more_vert,
          ),
        )
      ]),
      SizedBox(
        height: 7,
      ),
      Column(
        children: [
          Image(
            image: NetworkImage(
                'https://i1.sndcdn.com/artworks-000210380355-os67kh-t500x500.jpg'),
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 2.0, top: 3.0),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 45,
            ),
          ),
          //Icon(Icons.speaker_notes_outlined),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.mode_comment_outlined,
              size: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.near_me_outlined,
              size: 45,
            ),
          ),
          SizedBox(
            width: 600,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0, right: 2.0),
            child: Icon(Icons.bookmark_outline_sharp, size: 45),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0, top: 3.0),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              '$like likes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Text(
              '$name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Text(
              'Add a comment ...',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            Text(
              '3 days ago',
              style: TextStyle(fontSize: 10, color: Colors.black54),
            )
          ],
        ),
      )
    ],
  );
}

////////////////////////////////////////////////
///
Widget Post8(name, location, like) {
  return Column(
    children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Row(
          children: <Widget>[
            // hasStory ? smallProfileWithStory() : smallProfileWithoutStory()
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 3),
              child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://t4.ftcdn.net/jpg/03/42/83/77/360_F_342837754_fAC5ZI8YK8zSMYxXIZeIXFkx4sJCzDNV.jpg',
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  location,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.more_vert,
          ),
        )
      ]),
      SizedBox(
        height: 7,
      ),
      Column(
        children: [
          Image(
            image: NetworkImage(
                'https://imgix.bustle.com/wmag/2019/09/08/5d7462456cf4020008a91400_Serichai_BrandonMa__well_BTS-033.jpg?w=1200&fit=crop&crop=faces&auto=format%2Ccompress'),
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 2.0, top: 3.0),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.mode_comment_outlined,
              size: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 3.0),
            child: Icon(
              Icons.near_me_outlined,
              size: 45,
            ),
          ),
          SizedBox(
            width: 600,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0, right: 2.0),
            child: Icon(Icons.bookmark_outline_sharp, size: 45),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 2.0, top: 3.0),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              '$like likes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Text(
              '$name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Text(
              'Add a comment ...',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            Text(
              '3 days ago',
              style: TextStyle(fontSize: 10, color: Colors.black54),
            )
          ],
        ),
      )
    ],
  );
}

Widget personal() {
  return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  Text(
                    'Worood1_',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(width: 400),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 16.0),
                    child: Image.network(
                      'https://cdn3.iconfinder.com/data/icons/instagram-18/512/199_Instagram_Plus_Sets_Upload-512.png',
                      height: 35,
                    ),
                  ),
                  Icon(
                    Icons.dehaze,
                    size: 45,
                  )
                ],
              ),
            ],
          )),
      body: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 3.0, left: 16.0),
              child: CircleAvatar(
                radius: 90,
                backgroundImage: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/001/912/726/non_2x/beautiful-woman-in-frame-circular-avatar-character-free-vector.jpg'),
              ),
            ),
            SizedBox(
              width: 80,
            ),
            Text('0',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 90,
            ),
            Text('83',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(
              width: 90,
            ),
            Text('200',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ))
          ],
        ),
        Column(children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 250,
              ),
              Text('Posts',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black54,
                  )),
              SizedBox(
                width: 50,
              ),
              Text('Followers',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black54,
                  )),
              SizedBox(
                width: 50,
              ),
              Text('Following',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black54,
                  ))
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 16.0),
                      child: Text(
                        'My name is worood',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    )
                  ])
                ],
              ),
              Row(
                children: [
                  Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 5.0),
                      child: Row(children: [
                        Container(
                            child: Center(
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            height: 50,
                            //width: double.maxFinite,
                            //fit: BoxFit.cover
                            width: 550,
                            decoration: BoxDecoration(
                                //color: Colors.white,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.black54,
                                  width: 3,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))))
                      ]),
                    ),
                  ]),
                  SizedBox(
                    width: 10,
                  ),
                  Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 3.0),
                      child: Row(children: [
                        Container(
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                            ),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                //color: Colors.white,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.black54,
                                  width: 3,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))))
                      ]),
                    ),
                  ]),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => print('Profile'),
                      icon: Icon(
                        Icons.grid_on_sharp,
                        size: 60,
                      ),
                    ),
                    SizedBox(width: 400),
                    IconButton(
                      onPressed: () => print('Photos and Videos of You'),
                      icon: Icon(
                        Icons.perm_contact_cal_outlined,
                        color: Colors.black54,
                        size: 60,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ])
      ]));
}
