import 'package:flutter/material.dart';
import 'package:flutter_laravel/Admin/admin.dart';
import 'package:flutter_laravel/Apk_services/Book_services.dart';
import 'package:flutter_laravel/Apk_services/Wash_services.dart';
import 'package:flutter_laravel/Apk_services/services.dart';
import 'package:flutter_laravel/Wash_Man/Reservation_WashMan.dart';
import 'package:flutter_laravel/screens/aboutus.dart';
import 'package:flutter_laravel/screens/history/MyHistoryfulWidget.dart';
import 'package:flutter_laravel/screens/WashMan.dart';
import 'package:flutter_laravel/screens/login_screen.dart';
import 'package:flutter_laravel/services/adresse.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/comment.dart';
import 'package:flutter_laravel/services/complain.dart';
import 'package:flutter_laravel/services/reserver.dart';
import 'package:flutter_laravel/services/service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../icon_card.dart';

var comments = Com.comments;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    readToken();
  }

  void readToken() async {
    String token = await storage.read(key: 'token');
    Provider.of<Auth>(context, listen: false).tryToken(token: token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        title: Text('Washing Car'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Hello, ',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blueAccent)),
                            TextSpan(text: 'what are you\nlooking for?')
                          ],
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        children: [
                          TextSpan(text: "The washing service is near you\n"),
                        ])),
                RichText(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        children: [
                          TextSpan(
                              text:
                                  "You can easely have a reservation for a washing service in one click"),
                        ])),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                        child: IconCard(
                          iconData: Icons.book,
                          text: 'Booking',
                        ),
                        onTap: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BookService()));
                        }),
                    InkWell(
                        child: IconCard(
                          iconData: Icons.settings_suggest_outlined,
                          text: 'Services',
                        ),
                        onTap: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => service()));
                        }),
                    InkWell(
                        child: IconCard(
                          iconData: Icons.contact_support,
                          text: 'About us',
                        ),
                        onTap: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AboutUs()));
                        }),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Best Experiences',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          height: 400,
                          width: 250,
                          margin: EdgeInsets.all(5),
                          child: Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset('images/${index + 2}.PNG')),
                          ),
                          color: Colors.grey[50],
                        ),
                      ),
                    ),
                  ]),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Comments :',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        comments.length, (i) => StylistCard(comments[i]))),
              ],
            ),
          ),
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
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Role: Normal-User",
                          style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home),
                    onTap: () {
                      Provider.of<Com>(context, listen: false).index();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                  ),
                  ListTile(
                    title: Text('History, Rating, Complaint'),
                    leading: Icon(Icons.multiple_stop),
                    onTap: () async {
                      await Provider.of<Serv>(context, listen: false).index();
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                  ),
                ],
              );
            } else if (Auth.role == 2) {
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
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Role: Wash-Man",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home),
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
                    title: Text('Reservation of Clients'),
                    leading: Icon(Icons.book),
                    onTap: () async {
                      await Provider.of<Serv>(context, listen: false).index2();
                      await Provider.of<Adre>(context, listen: false).ShowAll();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ReservationClient()));
                    },
                  ),
                  ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.logout),
                    onTap: () {
                      Provider.of<Auth>(context, listen: false).logout();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                  ),
                ],
              );
            } else if (Auth.role == 0) {
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
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Role: Admin",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home),
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
                    title: Text('Complaits of Clients'),
                    leading: Icon(Icons.book),
                    onTap: () async {
                      await Provider.of<Comp>(context, listen: false).index();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => admin()));
                    },
                  ),
                  ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.logout),
                    onTap: () {
                      Provider.of<Auth>(context, listen: false).logout();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
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
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            color: Colors.blue[800],
            child: Column(
              children: <Widget>[
                Text(
                  stylist['created_at'].toString().substring(0, 10),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[850],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Username: " + stylist['user']['name'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 85,
                    ),
                    Text(
                      "Rating: ",
                      style: TextStyle(
                        color: Color(0xffFF8573),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xffFF8573),
                      size: 16,
                    ),
                    Text(
                      stylist['rating'],
                      style: TextStyle(
                        color: Color(0xffFF8573),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  stylist['comment'],
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 3.0,
        ),
      ],
    );
  }
}
