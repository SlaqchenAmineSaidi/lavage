import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_laravel/services/dio.dart';
import 'package:flutter_laravel/services/reserver.dart';

import 'auth.dart';

class Com extends ChangeNotifier {
  static List<dynamic> _comments;
  static List<dynamic> get comments => _comments;
  String _token;
  notifyListeners();
  // static List<dynamic> _price;
  // static List<dynamic> get price => _price;
  // static List<dynamic> _titles;
  // static List<dynamic> get titles => _titles;
  void comment({Map creds4}) async {
    try {
      _token = Auth.token;
      print(_token);
      Dio.Response response = await dio().post('/make',
          data: creds4,
          options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));
      print(creds4);
    } catch (e) {
      print(e);
    }
  }

  Future<void> index() async {
    Dio.Response response = await dio().get('/showComments/${Auth.s}');
    _comments = response.data;
  }
}
