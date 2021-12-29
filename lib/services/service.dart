import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_laravel/services/dio.dart';

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
}
