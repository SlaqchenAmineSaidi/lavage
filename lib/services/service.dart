import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_laravel/services/dio.dart';
import 'package:flutter_laravel/services/reserver.dart';

import 'auth.dart';

class Serv extends ChangeNotifier {
  static List<dynamic> _reservations;
  static List<dynamic> get reservations => _reservations;
  // static List<dynamic> _price;
  // static List<dynamic> get price => _price;
  // static List<dynamic> _titles;
  // static List<dynamic> get titles => _titles;
  void reserver({Map creds2}) async {
    try {
      print(creds2);
      Dio.Response response = await dio().post('/service', data: creds2);
      print(response.data.toString());
    } catch (e) {
      print(e);
    }
  }

  Future<void> index() async {
    Dio.Response response = await dio().get('/show/${Auth.s}');
    //print(response.data);
    _reservations = response.data;
    //print(response.data.toString().length);
    // _price = List.generate(
    //     reservations.length, (i) => reservations[i]['service']['price']);
    // _titles = List.generate(
    //     reservations.length, (i) => reservations[i]['service']['title']);
    // List<String> n = _reservations.toString().split(" ");
    // o = n[3];
    // g = o.replaceAll(',', '');
    //print(g);
  }
}
