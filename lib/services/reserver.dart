import 'dart:ffi';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_laravel/models/reservation.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/dio.dart';

class Res extends ChangeNotifier {
  String id;
  String a;
  String b;
  String r;
  static int d;
  String _token;
  void reserver({Map creds1}) async {
    try {
      _token = Auth.token;
      print(_token);
      Dio.Response response = await dio().post('/reserver',
          data: creds1,
          options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));
      a = response.data.toString();
      // Dio.Response response2 = await dio().post('/reserver', data: creds1);
      // b = response2.data.toString();
      List<String> l = a.split(" ");
      id = l[1];
      r = id.replaceAll('}', '');
      d = int.parse(r);
      print(d);
    } catch (e) {
      print(e);
    }
  }
}
