import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> bottons = [
      "IGTV",
      "Travel",
      "Music",
      "Food",
      "Art",
      "Decor",
      "Architecture",
      "Beauty",
      "DIA",
    ];
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                ),
                hintText: "search",
                contentPadding: EdgeInsets.all(0),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                fillColor: Color.fromRGBO(220, 220, 220, 1),
                filled: true,
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.person_add))
            ],
          ),
          SliverAppBar(
            title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  9,
                  (index) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(bottons[index]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
