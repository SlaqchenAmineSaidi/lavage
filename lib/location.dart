import 'package:flutter/material.dart';
import 'package:flutter_laravel/maps.dart';
import 'package:flutter_laravel/services/adresse.dart';
import 'package:flutter_laravel/services/service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class location extends StatefulWidget {
  const location({Key key}) : super(key: key);

  @override
  _locationState createState() => _locationState();
}

var lapti;
var longit;
var id = Serv.serviceId;

class _locationState extends State<location> {
  void getCurrentPosition() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastposition = await Geolocator.getLastKnownPosition();
    print(lastposition);
    var lap = position.latitude;
    lapti = lap;
    var long = position.longitude;
    longit = long;
    setState(() {
      locationMessage = "Position: laptitude $lapti, longitude $longit";
    });
  }

  var locationMessage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Location'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(children: <Widget>[
            Image.asset(
              'images/maps.jpg',
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 265.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Set your current position',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.map_sharp),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: FlatButton(
                    child: Text('Locate the current position',
                        style: TextStyle(color: Colors.blue)),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.blue,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.black,
                    onPressed: () {
                      getCurrentPosition();
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  locationMessage,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(
                  height: 40.0,
                ),
                FlatButton(
                  child: Text('View in the maps',
                      style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.blue,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                  color: Colors.indigo,
                  onPressed: () async {
                    Map creds3 = {
                      'adress2': lapti,
                      'adress1': longit,
                      'service_id': id,
                    };
                    Provider.of<Adre>(context, listen: false)
                        .adresse(creds3: creds3);
                    await Provider.of<Adre>(context, listen: false).index();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MapScreen()));
                    print(creds3);
                  },
                ),
              ],
            ),
          ]),
        ));
  }
}
