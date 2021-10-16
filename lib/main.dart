import 'package:contacts_01/models/users_viewmodel.dart';
import 'package:contacts_01/ui/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/loading_state.dart';
import 'models/user.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UsersViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Saving/Restoring Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    debugPrint('initState...');
    debugPrint('getSavedCounter called...');

    Future.microtask(() => context.read<UsersViewModel>().fetchUsers());

    super.initState();
  }

  Widget buildUserView(User user) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(user.name),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.phone),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // var favoritesViewModel = context.read<FavoritesViewModel>();
                var favoritesViewModel = Provider.of<UsersViewModel>(context, listen: false);
                favoritesViewModel.insert(user);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUsersListView(List<User> users) {
    if (users.isEmpty) {
      return Center(child: Text('Empty!'));
    }
    return ListView.builder(
      itemBuilder: (_context, index) => buildUserView(
        users[index],
      ),
      itemCount: users.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build...');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_context) => FavoritesPage())),
            icon: Consumer<UsersViewModel>(
              builder: (context, favoritesViewModel, child) => Text(
                '${favoritesViewModel.favorites.length}',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      body: Center(child: Consumer<UsersViewModel>(
        builder: (context, usersViewModel, child) {
          debugPrint('building users list..');
          debugPrint('usersViewModel.loadingState: ${usersViewModel.loadingState}');

          if (usersViewModel.loadingState == LoadingState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (usersViewModel.usersResponse.item1 != null) {
            return Center(
                child: Text(
              '${usersViewModel.usersResponse.item1?.message}',
              style: TextStyle(fontSize: 20),
            ));
          }
          return buildUsersListView(usersViewModel.usersResponse.item2 ?? []);
        },
      )),
    );
  }
}
