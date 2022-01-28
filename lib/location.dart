import 'package:flutter/material.dart';
import 'package:flutter_laravel/maps.dart';
import 'package:flutter_laravel/services/adresse.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class location extends StatefulWidget {
  const location({Key key}) : super(key: key);

  @override
  _locationState createState() => _locationState();
}

var lapti;
var longit;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FlatButton(
              child: Text('press'),
              color: Colors.black,
              onPressed: () {
                getCurrentPosition();
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(locationMessage),
          FlatButton(
            child: Text('press'),
            color: Colors.indigo,
            onPressed: () {
              getCurrentPosition();
              Map creds3 = {
                'adress2': lapti,
                'adress1': longit,
              };
              Provider.of<Adre>(context, listen: false).adresse(creds3: creds3);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MapScreen()));
              print(creds3);
            },
          ),
        ],
      ),
    );
  }
}
