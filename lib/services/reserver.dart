import 'dart:ffi';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_laravel/models/reservation.dart';
import 'package:flutter_laravel/services/dio.dart';

class Res extends ChangeNotifier {
  String id;
  String a;
  String r;
  static int d;
  void reserver({Map creds1}) async {
    try {
      print(creds1);
      Dio.Response response = await dio().post('/reserver', data: creds1);
      a = response.data.toString();
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
