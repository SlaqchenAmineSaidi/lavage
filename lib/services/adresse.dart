import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_laravel/services/dio.dart';
import 'package:flutter_laravel/services/reserver.dart';

import 'auth.dart';

class Adre extends ChangeNotifier {
  static List<dynamic> _adresses;
  static List<dynamic> get adresses => _adresses;
  String _token;
  notifyListeners();
  // static List<dynamic> _price;
  // static List<dynamic> get price => _price;
  // static List<dynamic> _titles;
  // static List<dynamic> get titles => _titles;
  void adresse({Map creds3}) async {
    try {
      _token = Auth.token;
      print(_token);
      Dio.Response response = await dio().post('/create',
          data: creds3,
          options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));
      print(creds3);
    } catch (e) {
      print(e);
    }
  }

  Future<void> index() async {
    Dio.Response response = await dio().get('/showAdresse/${Auth.s}');
    _adresses = response.data;
  }
}
