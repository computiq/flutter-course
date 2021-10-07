import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const ProviderScope(child: TabBarDemo()));
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext, Orientation, DeviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: const TabBar(
              labelColor: Colors.blue,
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.search)),
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
            appBar: AppBar(
              title: const Text('Task week 1'),
            ),
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, int index) {
                    var imageUrl =
                        'https://images.pexels.com/photos/1544947/pexels-photo-1544947.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';

                    return Center(
                      child: Container(
                        width: 400,
                        // color: Color(0xff162f5a),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 6),
                            color: const Color(0xff162f5a)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              imageUrl,
                              height: 30.h,
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.favorite_outline,
                                    color: Colors.white,
                                    size: 45,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white,
                                    size: 45,
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                    size: 45,
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '25 Likes',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Wrap(
                  spacing: 8.0, // gap between adjacent chips
                  runSpacing: 4.0, // gap between lines
                  children: const [
                    Card(child: Text('ali')),
                  ],
                ),
                const Icon(Icons.directions_bike),
              ],
            ),
          ),
        ),
      );
    });
  }
}
