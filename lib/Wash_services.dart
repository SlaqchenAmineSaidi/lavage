import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laravel/models/reservation.dart';
import 'package:flutter_laravel/screens/home_screen.dart';
import 'package:flutter_laravel/screens/login_screen.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/dio.dart';
import 'package:flutter_laravel/services/reserver.dart';
import 'package:flutter_laravel/services/service.dart';
import 'package:provider/provider.dart';

class Wash_services extends StatefulWidget {
  const Wash_services({Key key}) : super(key: key);

  @override
  _Wash_servicesState createState() => _Wash_servicesState();
}

class _Wash_servicesState extends State<Wash_services> {
  String s, d, f, g;
  int a;
  List<bool> isSelected;
  List<bool> isSelected1;
  List<bool> isSelected2;
  List<bool> isSelected3;
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(110, 50),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    backgroundColor: Colors.indigoAccent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6.0)),
    ),
  );

  @override
  void initState() {
    isSelected = [false];
    isSelected1 = [false];
    isSelected2 = [false];
    isSelected3 = [false];
    a = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Services'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(children: [
            Row(
              children: [
                ToggleButtons(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderColor: Colors.black,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 25,
                            ),
                            padding: const EdgeInsets.all(15.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 40,
                              child: Icon(
                                Icons.directions_car_filled_rounded,
                                size: 60.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Body Wash',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              '20Dh',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                    isSelected: isSelected,
                    selectedColor: Colors.amberAccent,
                    selectedBorderColor: Colors.black,
                    onPressed: (int index) {
                      setState(() {
                        isSelected[index] = !isSelected[index];
                      });
                    }),
                SizedBox(
                  width: 15.0,
                ),
                ToggleButtons(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderColor: Colors.black,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            padding: const EdgeInsets.all(15.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 40,
                              child: Icon(
                                Icons.airline_seat_recline_normal_rounded,
                                size: 60.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Interior Cleaning',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              '25Dh',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                    isSelected: isSelected1,
                    selectedColor: Colors.amberAccent,
                    selectedBorderColor: Colors.black,
                    onPressed: (int index) {
                      setState(() {
                        isSelected1[index] = !isSelected1[index];
                      });
                    }),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                ToggleButtons(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderColor: Colors.black,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 25,
                            ),
                            padding: const EdgeInsets.all(15.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 40,
                              child: Icon(
                                Icons.lightbulb,
                                size: 60.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Light Service',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              '25Dh',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                    isSelected: isSelected2,
                    selectedColor: Colors.amberAccent,
                    selectedBorderColor: Colors.black,
                    onPressed: (int index) {
                      setState(() {
                        isSelected2[index] = !isSelected2[index];
                      });
                    }),
                SizedBox(
                  width: 15.0,
                ),
                ToggleButtons(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderColor: Colors.black,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            padding: const EdgeInsets.all(15.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 40,
                              child: Icon(
                                Icons.settings_suggest,
                                size: 60.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Engine Detailing',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              '30Dh',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                    isSelected: isSelected3,
                    selectedColor: Colors.amberAccent,
                    selectedBorderColor: Colors.black,
                    onPressed: (int index) {
                      setState(() {
                        isSelected3[index] = !isSelected3[index];
                      });
                    }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: TextButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    int price() {
                      if (isSelected.toString() == '[true]') {
                        a += 20;
                      }
                      if (isSelected1.toString() == '[true]') {
                        a += 25;
                      }
                      if (isSelected2.toString() == '[true]') {
                        a += 25;
                      }
                      if (isSelected3.toString() == '[true]') {
                        a += 30;
                      }
                      return a;
                    }

                    String service() {
                      if (isSelected.toString() == '[true]') {
                        s = "Body Wash";
                      } else {
                        s = '';
                      }
                      if (isSelected1.toString() == '[true]') {
                        d = "Interior Cleaning";
                      } else {
                        d = '';
                      }
                      if (isSelected2.toString() == '[true]') {
                        f = "Light Service";
                      } else {
                        f = '';
                      }
                      if (isSelected3.toString() == '[true]') {
                        g = "Engine Detailing";
                      } else {
                        g = '';
                      }
                      return s + d + f + g;
                    }

                    Map creds2 = {
                      'reservation_id': Res.d,
                      'title': service(),
                      'price': price(),
                    };
                    if (isSelected != [false] ||
                        isSelected2 != [false] ||
                        isSelected3 != [false] ||
                        isSelected1 != [false]) {
                      Provider.of<Serv>(context, listen: false)
                          .reserver(creds2: creds2);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }
                    print(price);
                  },
                  child: Text(
                    'Book',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}
