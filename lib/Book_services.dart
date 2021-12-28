// import 'dart:collection';
import 'package:flutter/material.dart';
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
            Text('Choose the gender',
                style: TextStyle(
                  color: Colors.cyan[200],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 15.0, left: 15.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  borderColor: Colors.black,
                  fillColor: Colors.grey,
                  borderWidth: 2,
                  selectedBorderColor: Colors.cyanAccent,
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                  children: [
                    Icon(
                      Icons.drive_eta,
                      size: 90.0,
                    ),
                    Icon(
                      Icons.motorcycle_outlined,
                      size: 90.0,
                    ),
                    Icon(
                      Icons.airport_shuttle_rounded,
                      size: 90.0,
                    ),
                    Icon(
                      Icons.electric_rickshaw,
                      size: 90.0,
                    )
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
            Text('Select Date & Time',
                style: TextStyle(
                  color: Colors.cyan[200],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
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
            ToggleButtons(
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
          ],
        ),
      ),
    );
  }
}
