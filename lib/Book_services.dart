import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BookService extends StatefulWidget {
  const BookService({Key key}) : super(key: key);

  @override
  _BookServiceState createState() => _BookServiceState();
}

class _BookServiceState extends State<BookService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Washing Car'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.car_repair,
                    size: 100.0,
                  ),
                ),
                Icon(
                  Icons.motorcycle_outlined,
                  size: 100.0,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Icon(
                  Icons.airport_shuttle_rounded,
                  size: 100.0,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Icon(
                  Icons.bus_alert,
                  size: 100.0,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Icon(
                  Icons.electric_rickshaw,
                  size: 100.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
