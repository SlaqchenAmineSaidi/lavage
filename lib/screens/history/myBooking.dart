import 'package:flutter/material.dart';
import 'package:flutter_laravel/models/reservation.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/reserver.dart';
import 'package:provider/provider.dart';

var reservations = Res.g;

class MyBooking extends StatefulWidget {
  const MyBooking({Key key}) : super(key: key);

  @override
  _MyBookingState createState() => _MyBookingState();
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
              Res.g.toString(),
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
                  '15-05-2020',
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
                child: Text(
                  '10:00 AM',
                  style: TextStyle(color: Colors.black, fontSize: 13.0),
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
