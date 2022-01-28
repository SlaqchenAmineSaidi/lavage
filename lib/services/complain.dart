import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_laravel/services/dio.dart';
import 'package:flutter_laravel/services/reserver.dart';

import 'auth.dart';

class Comp extends ChangeNotifier {
  static List<dynamic> _complains;
  static List<dynamic> get complains => _complains;
  String _token;
  notifyListeners();
  // static List<dynamic> _price;
  // static List<dynamic> get price => _price;
  // static List<dynamic> _titles;
  // static List<dynamic> get titles => _titles;
  void complain({Map creds5}) async {
    try {
      _token = Auth.token;
      print(_token);
      Dio.Response response = await dio().post('/complain',
          data: creds5,
          options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));
      print(creds5);
    } catch (e) {
      print(e);
    }
  }

  Future<void> index() async {
    Dio.Response response = await dio().get('/showComplaints/');
    _complains = response.data;
  }
}
