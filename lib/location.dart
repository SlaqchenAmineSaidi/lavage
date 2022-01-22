import 'package:flutter/material.dart';
import 'package:flutter_laravel/maps.dart';
import 'package:geolocator/geolocator.dart';

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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MapScreen()));
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(locationMessage),
        ],
      ),
    );
  }
}
