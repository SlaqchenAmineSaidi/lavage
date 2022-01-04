import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_laravel/services/dio.dart';
import 'package:flutter_laravel/services/reserver.dart';

class Serv extends ChangeNotifier {
  void reserver({Map creds2}) async {
    try {
      print(creds2);
      Dio.Response response = await dio().post('/service', data: creds2);
      print(response.data.toString());
    } catch (e) {
      print(e);
    }
  }

  void index() async {
    Dio.Response response = await dio().get('/showen/${Res.d}');
    print(response.data);
    // List<String> n = _reservations.toString().split(" ");
    // o = n[3];
    // g = o.replaceAll(',', '');
    //print(g);
  }
}
