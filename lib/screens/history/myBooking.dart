import 'package:flutter/material.dart';
import 'package:flutter_laravel/models/reservation.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/reserver.dart';
import 'package:provider/provider.dart';

var reservations = Res.reservations;

class MyBooking extends StatefulWidget {
  const MyBooking({Key key}) : super(key: key);

  @override
  _MyBookingState createState() => _MyBookingState();
}

String o, g, day, dtt, times;
List<String> n = reservations.toString().split(" ");
//print(n.length);
String id_last_car = n[(n.length) - 15];
int id_last = (n.length) - 15;
//print(id_last_car);
String re = id_last_car.replaceAll(',', '');
int de = int.parse(re);
int id_car = 0;
String genders(int gender) {
  String dtt = "", s = "", times = "";
  for (id_car; id_car < de; id_car++) {
    int first = id_last + 2 - id_car * 16;
    o = n[first];
    g = o.replaceAll(',', '');
    s = s + " " + g;
    dtt = dtt + " " + n[first + 2];
    String da = n[first + 5] + " " + n[first + 6];
    day = da.replaceAll(',', '');
    times = times + " " + day;
  }
  if (gender == 1) {
    return s;
  }
  if (gender == 2) {
    return dtt;
  }
  if (gender == 3) {
    return times;
  }
}

class _MyBookingState extends State<MyBooking> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(builder: (context, auth, child) {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
            alignment: Alignment.topLeft,
            child: Text(
              'Type of vehicule ',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              " " + genders(1),
              //         for (id_car; id_car < de; id_car++) {
              //   int first = id_last + 2 - id_car * 16;
              //   o = n[first];
              //   g = o.replaceAll(',', '');
              // }
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
          const Divider(
            height: 8,
            thickness: 4,
            endIndent: 10,
            indent: 10,
            color: Colors.black,
          ),
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
            alignment: Alignment.topLeft,
            child: Text(
              'Date & time detail ',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  'Date:',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  " " + genders(2),
                  //Res.dat,
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  'Time:',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(" " + genders(3)),
              ),
            ],
          ),
          Divider(
            height: 8,
            thickness: 4,
            indent: 10,
            endIndent: 10,
            color: Colors.black,
          ),
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
            alignment: Alignment.topLeft,
            child: Text(
              'Service ',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  'Type',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  'Engine software',
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  'Price',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  '25 DH',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0),
                ),
              ),
            ],
          ),
          Divider(
            height: 8,
            thickness: 4,
            indent: 10,
            endIndent: 10,
            color: Colors.black,
          ),
        ],
      );
    });
  }
}
