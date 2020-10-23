import 'dart:convert';
import 'package:centro_edu_unificado/data/dummy_users.dart';
import 'package:centro_edu_unificado/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Users with ChangeNotifier {
  static const _baseUrl = 'https://centro-edu-unificado-1106e.firebaseio.com/';
  final Map<String, User> _items = {...dummy_users};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) async {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
        user.id,
        (_) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      final response = await http.post(
        "$_baseUrl/users.json",
        body: json.encode(
          {
            'name': user.name,
            'email': user.email,
            'avatarUrl': user.avatarUrl,
          },
        ),
      );

      final id = json.decode(response.body)['name'];
//adciona usuarios

      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
