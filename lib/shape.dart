import 'package:flutter/material.dart';

class IgCard extends StatelessWidget {
  const IgCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 4.0, style: BorderStyle.solid),
      ),
      child: Column(
        children: [
          Image.network(
              'https://images.unsplash.com/photo-1584551882802-ca081b505b49?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=841&q=80'),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  child: const Icon(
                    Icons.favorite_border_outlined,
                    size: 36.0,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0.0),
                ),
                const Text('  '),
                Container(
                  child: const Icon(
                    Icons.location_on_outlined,
                    size: 36.0,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0.0),
                ),
                Expanded(
                  child: Container(child: null),
                ),
                Container(
                  child: const Icon(Icons.menu_outlined,
                      size: 36.0, color: Colors.white),
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Text('36',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                Text('  '),
                Text('Likes',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
