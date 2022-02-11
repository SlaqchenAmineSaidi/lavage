import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/home_screen.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/complain.dart';
import 'package:provider/provider.dart';

class admin extends StatefulWidget {
  const admin({Key key}) : super(key: key);

  @override
  _adminState createState() => _adminState();
}

var complains = Comp.complains;

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      }),
                  Text(
                    'Complaints :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      complains.length, (i) => StylistCard(complains[i]))),
            ],
          ),
        ),
      ),
    );
  }
}

class StylistCard extends StatelessWidget {
  final stylist;
  StylistCard(this.stylist);

  @override
  Widget build(BuildContext context) {
    int idwash = stylist['WashId'];
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
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
                      width: 90,
                    ),
                    Text(
                      "User with problem: ",
                      style: TextStyle(
                        color: Color(0xffFF8573),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      stylist['user_id'].toString(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Wash Id:" + stylist['WashId'].toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Complaint:" + stylist['complain'],
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FlatButton(
                  child: Text('Delete the wash man',
                      style: TextStyle(color: Colors.black)),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.indigo,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                  color: Colors.red,
                  onPressed: () async {
                    await Provider.of<Auth>(context, listen: false)
                        .destroy(idwash);
                  },
                ),
                FlatButton(
                  child: Text('Remake to wash-man',
                      style: TextStyle(color: Colors.black)),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.indigo,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                  color: Colors.green,
                  onPressed: () async {
                    Provider.of<Auth>(context, listen: false).updatWash(idwash);
                  },
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
