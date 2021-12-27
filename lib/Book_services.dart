import 'package:flutter/material.dart';

class BookService extends StatefulWidget {
  const BookService({Key key}) : super(key: key);

  @override
  _BookServiceState createState() => _BookServiceState();
}

class _BookServiceState extends State<BookService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Washing Car'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookService()));
                      },
                      child: Icon(
                        Icons.drive_eta,
                        size: 70.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Icon(
                    Icons.motorcycle_outlined,
                    size: 70.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Icon(
                    Icons.airport_shuttle_rounded,
                    size: 70.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Icon(
                    Icons.electric_rickshaw,
                    size: 70.0,
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 25.0,
                  ),
                  Text(
                    'Car',
                    style: TextStyle(color: Colors.cyan[200], fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  Text(
                    'Motor',
                    style: TextStyle(color: Colors.cyan[200], fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 60.0,
                  ),
                  Text(
                    'Bus',
                    style: TextStyle(color: Colors.cyan[200], fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Text(
                    'Electric_rickshaw',
                    style: TextStyle(color: Colors.cyan[200], fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
