import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_laravel/services/dio.dart';

class Res extends ChangeNotifier {
  void reserver({Map creds1}) async {
    try {
      print(creds1);
      Dio.Response response = await dio().post('/reserver', data: creds1);
      print(response.data.toString());
    } catch (e) {
      print(e);
    }
  }
}
