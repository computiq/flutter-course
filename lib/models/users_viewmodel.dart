import 'dart:convert';

import 'package:contacts_01/models/error.dart';
import 'package:contacts_01/models/loading_state.dart';
import 'package:contacts_01/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

class UsersViewModel extends ChangeNotifier {
  List<User> favorites = [];
  late Tuple2<ErrorResponse?, List<User>?> usersResponse;
  LoadingState loadingState = LoadingState.idle;

  UsersViewModel() {
    usersResponse = const Tuple2(null, null);
  }

  void insert(User user) {
    favorites.add(user);
    notifyListeners();
  }

  void fetchUsers() async {
    loadingState = LoadingState.loading;
    notifyListeners();

    var response;
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      debugPrint('url: ${url}');
      response = await http.get(
        url,
      );
      debugPrint('response: ${response}');
      debugPrint('response.statusCode: ${response.statusCode}');
      var jsonUsers = jsonDecode(response.body);
      // jsonUsers[0]['name'] = null;
      var users = jsonUsers.map<User>((_userJson) => User.fromJson(_userJson)).toList();

      // debugPrint('users.length: ${users.length}');
      usersResponse = Tuple2(null, users);
    } catch (e) {
      if (response?.statusCode == 200) {
        usersResponse = Tuple2(ErrorResponse('توجد مشكلة في عرض المعلومات', response?.statusCode), null);
      } else {
        usersResponse = Tuple2(ErrorResponse('لا يمكن الإتصال. يرجى المحاولة فيما بعد...', -1), null);
      }

      debugPrint('e: $e');
    }

    loadingState = LoadingState.finished;
    notifyListeners();
  }
}
