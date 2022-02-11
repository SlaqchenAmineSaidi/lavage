import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_laravel/services/dio.dart';
import 'package:flutter_laravel/services/service.dart';

import 'auth.dart';

class Adre extends ChangeNotifier {
  static List<dynamic> _adresses;
  static List<dynamic> get adresses => _adresses;
  static List<dynamic> _Alladresses;
  static List<dynamic> get Alladresses => _Alladresses;
  int id;
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
      Dio.Response response = await dio().post('/create', data: creds3);
      print(creds3);
    } catch (e) {
      print(e);
    }
  }

  Future<void> index() async {
    Dio.Response response = await dio().get('/showAdresse/${Serv.serviceId}');
    _adresses = response.data;
  }

  Future<void> index2() async {
    Dio.Response response = await dio().get('/showAdresse/$id');
    _adresses = response.data;
  }

  Future<void> ShowAll() async {
    Dio.Response response = await dio().get('/showallAdresses');
    //print(response.data);
    if (_Alladresses != null) {
      _Alladresses = null;
    }
    _Alladresses = response.data;
    id = _Alladresses[0]['service_id'];
    print(id);
  }
}
