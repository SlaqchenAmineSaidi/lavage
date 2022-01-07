import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/dio.dart';

class Res extends ChangeNotifier {
  static List<dynamic> _reservations;
  static List<dynamic> get reservations => _reservations;
  static List<dynamic> _ids;
  static List<dynamic> get ids => _ids;
  String id;
  String o;
  String a;
  String b;
  String r;
  static String g;
  static String dat;
  static String day;
  static String gender;
  static int d;
  int i = 0;
  int prem = 0;
  String _token;
  void reserver({Map creds1}) async {
    if (prem == 0) {
      i += 18;
      prem++;
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
    } else {
      prem++;
      i = i + 16;
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

  Future<void> index() async {
    _token = Auth.token;
    print(_token);
    // print(Auth.s);
    //Dio.Response response = await dio().get('/showen/${Auth.s}');
    //print(response.data);
    //_reservations = response.data;

    //_ids = List.generate(reservations.length, (i) => reservations[i]['id']);
    //   .then((value) {
    // _reservations = value.data;
    // int id_car = 0;
    // print(_reservations);
    // List<String> n = _reservations.toString().split(" ");
    //print(n.length);
    // String id_last_car = n[(n.length) - 15];
    // int id_last = (n.length) - 15;
    // //print(id_last_car);
    // String re = id_last_car.replaceAll(',', '');
    // int de = int.parse(re);
    // print(de - 1);
    // for (id_car; id_car < de; id_car++) {
    //   print(value.data[0]['reservations'][id_car]['gender']);
    // }
    // for (id_car; id_car < de; id_car++) {
    //   print(value.data[0]['reservations'][id_car]['day']);
    // }
    // for (id_car; id_car < de; id_car++) {
    //   print(value.data[0]['reservations'][id_car]['time']);
    // }
    // for (id_car; id_car < de; id_car++) {
    //   int first = id_last + 2 - id_car * 16;
    //   o = n[first];
    //   //print(o);
    //   String dt = n[first + 2];
    //   //dat = dt.replaceAll(',', '');
    //   print(dt);
    //   String da = n[first + 5] + " " + n[first + 6];
    //   //print(da);
    //   g = o.replaceAll(',', '');
    //   print(g);
    //   day = da.replaceAll(',', '');
    //   print(day);
    // }
    // }
  }
  // void index() async {
  //   Dio.Response response = await dio().get('/showen/${Auth.s}',
  //       options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));
  //   _reservations = response.data;
  // }
}
