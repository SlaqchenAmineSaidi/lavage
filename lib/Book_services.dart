// import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_laravel/Wash_services.dart';
import 'package:table_calendar/table_calendar.dart';

class BookService extends StatefulWidget {
  const BookService({Key key}) : super(key: key);

  @override
  _BookServiceState createState() => _BookServiceState();
}

class _BookServiceState extends State<BookService> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  List<bool> isSelected;
  List<bool> _isSelected1;
  List<bool> _isSelected2;
  List<bool> _isSelected3;
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(110, 50),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    backgroundColor: Colors.indigo[400],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6.0)),
    ),
  );
  @override
  void initState() {
    isSelected = [false, false, false, false];
    _isSelected1 = [false, false, false, false];
    _isSelected2 = [false, false, false, false];
    _isSelected3 = [false, false, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Washing Car'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(right: 100, left: 100),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      border: Border.all(
                          color: Colors.blue, // Set border color
                          width: 3.0), // Set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 3))
                      ] // Make rounded corner of border
                      ),
                  child: Text(
                    "Choose your gender",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                )),
            Padding(
              padding:
                  const EdgeInsets.only(top: 12.0, right: 15.0, left: 15.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  borderColor: Colors.black,
                  fillColor: Colors.white,
                  borderWidth: 2,
                  selectedBorderColor: Colors.blue,
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                  children: [
                    Image.asset('images/caar.png', width: 100.0),
                    Image.asset('images/buus.PNG', width: 100.0),
                    Image.asset('images/truck_logo.jpg', width: 100.0),
                    Image.asset('images/moto_logo.png', width: 100.0),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        if (buttonIndex == index) {
                          isSelected[buttonIndex] = !isSelected[buttonIndex];
                        } else {
                          isSelected[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  isSelected: isSelected,
                  color: Colors.green,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  margin: EdgeInsets.only(right: 100, left: 100),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      border: Border.all(
                          color: Colors.blue, // Set border color
                          width: 3.0), // Set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 3))
                      ] // Make rounded corner of border
                      ),
                  child: Text(
                    "Select Date & Time",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                )),
            TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(2023, 10, 16),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                // Use `selectedDayPredicate` to determine which day is currently selected.
                // If this returns true, then `day` will be marked as selected.

                // Using `isSameDay` is recommended to disregard
                // the time-part of compared DateTime objects.
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  // Call `setState()` when updating the selected day
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                _focusedDay = focusedDay;
              },
            ),
            Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  child: Text("12 Slots"),
                  margin: EdgeInsets.only(right: 140, left: 140),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(
                          color: Colors.pink[800], // Set border color
                          width: 3.0), // Set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 3))
                      ] // Make rounded corner of border
                      ),
                )),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: ToggleButtons(
                children: [
                  Text(
                    '     09:00 AM     ',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  Text(
                    '     10:00 AM     ',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  Text(
                    '     11:00 AM     ',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  Text(
                    '     12:00 AM     ',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
                borderColor: Colors.black,
                isSelected: _isSelected1,
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < _isSelected1.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        _isSelected1[buttonIndex] = !_isSelected1[buttonIndex];
                      } else {
                        _isSelected1[buttonIndex] = false;
                      }
                    }
                  });
                },
              ),
            ),
            ToggleButtons(
              children: [
                Text(
                  '     01:00 PM     ',
                  style: TextStyle(color: Colors.blueGrey),
                ),
                Text(
                  '     02:00 PM     ',
                  style: TextStyle(color: Colors.blueGrey),
                ),
                Text(
                  '     03:00 PM     ',
                  style: TextStyle(color: Colors.blueGrey),
                ),
                Text(
                  '     04:00 PM     ',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ],
              isSelected: _isSelected2,
              borderColor: Colors.black,
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < _isSelected2.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      _isSelected2[buttonIndex] = !_isSelected2[buttonIndex];
                    } else {
                      _isSelected2[buttonIndex] = false;
                    }
                  }
                });
              },
            ),
            ToggleButtons(
              children: [
                Text(
                  '     05:00 PM     ',
                  style: TextStyle(color: Colors.blueGrey),
                ),
                Text(
                  '     06:00 PM     ',
                  style: TextStyle(color: Colors.blueGrey),
                ),
                Text(
                  '     07:00 PM     ',
                  style: TextStyle(color: Colors.blueGrey),
                ),
                Text(
                  '     08:00 PM     ',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ],
              isSelected: _isSelected3,
              borderColor: Colors.black,
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < _isSelected3.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      _isSelected3[buttonIndex] = !_isSelected3[buttonIndex];
                    } else {
                      _isSelected3[buttonIndex] = false;
                    }
                  }
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                child: TextButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Wash_services()));
                  },
                  child: Text('Next'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
