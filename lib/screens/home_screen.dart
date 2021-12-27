import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/login_screen.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

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
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Washing Car'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                  child: InkWell(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/im_log.jpg'),
                  radius: 65.0,
                ),
              )),
              SizedBox(
                width: 70.0,
              ),
              Material(
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/im_login.png'),
                    radius: 65.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 60,
              ),
              Text('Book Services'),
              SizedBox(
                width: 120,
              ),
              Text('My Account'),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 140,
              ),
              Material(
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/histo.jpg'),
                    radius: 65.0,
                  ),
                ),
              ),
            ],
          ),
          Row(children: [
            SizedBox(
              width: 160,
            ),
            Text('Book Services'),
          ]),
        ],
      ),
      drawer: Drawer(child: Consumer<Auth>(builder: (context, auth, child) {
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
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () {
                  Provider.of<Auth>(context, listen: false).logout();
                },
              ),
            ],
          );
        }
      })),
    );
  }
}
