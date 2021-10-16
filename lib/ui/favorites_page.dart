import 'package:contacts_01/models/users_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage();

  @override
  Widget build(BuildContext context) {
    var favorites = context.read<UsersViewModel>().favorites;
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Users'),),
        body: ListView.builder(
      itemBuilder: (_context, index) => Card(child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(favorites[index].name),
      )),
      itemCount: favorites.length,
    ));
  }
}
