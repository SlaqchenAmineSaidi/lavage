import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_laravel/services/dio.dart';
import 'package:flutter_laravel/services/reserver.dart';

import 'auth.dart';

class Serv extends ChangeNotifier {
  static List<dynamic> _reservations;
  static List<dynamic> get reservations => _reservations;
  static List<dynamic> _reservationsAd;
  static List<dynamic> get reservationsAd => _reservationsAd;
  static int _ServiceId;
  static int get serviceId => _ServiceId;
  notifyListeners();
  // static List<dynamic> _price;
  // static List<dynamic> get price => _price;
  // static List<dynamic> _titles;
  // static List<dynamic> get titles => _titles;
  void reserver({Map creds2}) async {
    try {
      print(creds2);
      Dio.Response response = await dio().post('/service', data: creds2);
      print(response.data.toString());
      _ServiceId = response.data['id'];
      print(_ServiceId);
    } catch (e) {
      print(e);
    }
  }

  Future<void> index() async {
    Dio.Response response = await dio().get('/show/${Auth.s}');
    //print(response.data);
    if (_reservations != null) {
      _reservations = null;
    }
    _reservations = response.data;
  }

  Future<void> index2() async {
    Dio.Response response = await dio().get('/showall');
    if (_reservationsAd != null) {
      _reservationsAd = null;
    }
    _reservationsAd = response.data;
  }
}
