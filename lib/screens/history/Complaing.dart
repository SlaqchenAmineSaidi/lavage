import 'package:flutter/material.dart';
import 'package:flutter_laravel/screens/home_screen.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/comment.dart';
import 'package:flutter_laravel/services/complain.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class Complaings extends StatefulWidget {
  const Complaings({Key key}) : super(key: key);
  @override
  _ComplaingsState createState() => _ComplaingsState();
  static String id;
}

class _ComplaingsState extends State<Complaings> {
  TextEditingController _complainController = TextEditingController();
  TextEditingController _washmanController = TextEditingController();
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Reviews and rating',
                style: TextStyle(color: Colors.black))),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(children: <Widget>[
            Image.asset(
              'images/complain.jpg',
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                SizedBox(
                  height: 240,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3 + 20.0,
                    color: Colors.blue[100],
                    child: Consumer<Auth>(builder: (context, auth, child) {
                      return Column(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${now.day}-' + '${now.month}-' + '${now.year}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Complaint",
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0),
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: _washmanController,
                            validator: (value) => value.isEmpty
                                ? 'please enter the Wash-man ID'
                                : null,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: 'Wash-Man Id',
                              prefixIcon: Icon(
                                Icons.comment,
                              ),
                              fillColor: Colors.transparent,
                              errorStyle: TextStyle(
                                fontSize: 15,
                                //backgroundColor: Colors.transparent,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _complainController,
                            validator: (value) => value.isEmpty
                                ? 'please enter your complain'
                                : null,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: 'Complain',
                              prefixIcon: Icon(
                                Icons.comment,
                              ),
                              fillColor: Colors.transparent,
                              errorStyle: TextStyle(
                                fontSize: 15,
                                //backgroundColor: Colors.transparent,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          FlatButton(
                            onPressed: () async {
                              Complaings.id = _washmanController.text;
                              Map creds5 = {
                                'complain': _complainController.text,
                                'WashId': Complaings.id
                              };
                              Provider.of<Comp>(context, listen: false)
                                  .complain(creds5: creds5);
                              Provider.of<Auth>(context, listen: false).updat();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                              print(creds5);
                            },
                            child: Text('Send Complain',
                                style: TextStyle(color: Colors.blue)),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.blue,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(50)),
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
