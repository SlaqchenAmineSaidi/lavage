import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/aboutus.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/service.dart';
import 'package:provider/provider.dart';

import '../WashMan.dart';
import '../home_screen.dart';
import '../login_screen.dart';
import 'MyHistoryfulWidget.dart';

var reservations = Serv.reservations;

class Reservation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey[300],
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/l.jpg'), fit: BoxFit.cover)),
            ),
            SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'history of reservations',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(reservations.length,
                                      (i) => StylistCard(reservations[i]))

                                  // StylistCard(salons[0]),
                                  // StylistCard(salons[1]),
                                  // StylistCard(salons[2]),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Consumer<Auth>(builder: (context, auth, child) {
          if (!auth.authenticated) {
            return ListView(
              children: [
                ListTile(
                  title: Text('Login'),
                  leading: Icon(Icons.login),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
              ],
            );
          } else {
            if (Auth.role == 1) {
              return ListView(
                children: [
                  DrawerHeader(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          auth.user.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          auth.user.email,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.history),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                  ),
                  ListTile(
                    title: Text('My History'),
                    leading: Icon(Icons.history),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyHistoryfulWidget()));
                    },
                  ),
                  ListTile(
                    title: Text('Become Wash-man'),
                    leading: Icon(Icons.wash),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => WashMan()));
                    },
                  ),
                  ListTile(
                    title: Text('Contact us'),
                    leading: Icon(Icons.contact_support),
                    onTap: () {
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => SalonForm()));
                    },
                  ),
                  ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.logout),
                    onTap: () {
                      Provider.of<Auth>(context, listen: false).logout();
                    },
                  ),
                ],
              );
            } else {
              return ListView(
                children: [
                  DrawerHeader(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          auth.user.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          auth.user.email,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.history),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                  ),
                  ListTile(
                    title: Text('About us'),
                    leading: Icon(Icons.contact_support),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    },
                  ),
                  ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.logout),
                    onTap: () {
                      Provider.of<Auth>(context, listen: false).logout();
                    },
                  ),
                ],
              );
            }
          }
        }),
      ),
    );
  }
}

class StylistCard extends StatelessWidget {
  final stylist;
  StylistCard(this.stylist);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height / 3 - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue[900],
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Gender: " + stylist['gender'],
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Day: " + stylist['day'].toString().substring(0, 11),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Time: " + stylist['time'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                Wrap(children: [
                  Text(
                    "Service title: " + stylist['service']['title'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "price: " + stylist['service']['price'].toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
