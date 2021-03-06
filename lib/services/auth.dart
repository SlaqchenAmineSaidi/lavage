import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_laravel/models/user.dart';
import 'package:flutter_laravel/screens/history/Complaing.dart';
import 'package:flutter_laravel/services/complain.dart';
import 'package:flutter_laravel/services/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;
  User _user;
  static String _token;
  static int s;
  static int _role;
  static int get role => _role;

  bool get authenticated => _isLoggedIn;
  User get user => _user;
  static String get token => _token;

  final storage = new FlutterSecureStorage();

  void login({Map creds}) async {
    print(creds);

    try {
      Dio.Response response = await dio().post('/login', data: creds);
      print(response.data.toString());
      String token = response.data.toString();
      this.tryToken(token: token);
    } catch (e) {
      print(e);
    }
  }

  void store({Map creds}) async {
    print(creds);

    try {
      Dio.Response response = await dio().post('/store', data: creds);
      print(response.data.toString());

      String token = response.data.toString();
      this.tryToken(token: token);
    } catch (e) {
      print(e);
    }
  }

  void update() async {
    try {
      Dio.Response response = await dio().put('/update',
          options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));
      print(response.data.toString());
    } catch (e) {
      print(e);
    }
  }

  void updat() async {
    try {
      Dio.Response response = await dio().put(
        '/updat/${Complaings.id}',
      );
      print(response.data.toString());
    } catch (e) {
      print(e);
    }
  }

  void updatWash(int id) async {
    try {
      Dio.Response response = await dio().put(
        '/updatWash/$id',
      );
      print(response.data.toString());
    } catch (e) {
      print(e);
    }
  }

  void tryToken({String token}) async {
    if (token == null) {
      return;
    } else {
      try {
        Dio.Response response = await dio().get('/user',
            options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));
        this._isLoggedIn = true;
        this._user = User.fromJson(response.data);
        _role = response.data['role'];
        print(response.data['role']);
        String a = response.data.toString();
        List<String> l = a.split(" ");
        String id = l[1];
        String r = id.replaceAll(',', '');
        s = int.parse(r);
        _token = token;
        this.storeToken(token: token);
        notifyListeners();
        print(_user);
      } catch (e) {
        print(e);
      }
    }
  }

  void storeToken({String token}) async {
    this.storage.write(key: 'token', value: token);
  }

  void logout() async {
    try {
      Dio.Response response = await dio().get('/user/revoke',
          options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));

      cleanUp();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void destroy(int id) async {
    try {
      Dio.Response response = await dio().delete('/destroy/$id');
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void cleanUp() async {
    this._user = null;
    this._isLoggedIn = false;
    _token = null;
    await storage.delete(key: 'token');
  }
}
