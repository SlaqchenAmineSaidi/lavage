// import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_laravel/Wash_services.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class BookService extends StatefulWidget {
  const BookService({Key key}) : super(key: key);

  @override
  _BookServiceState createState() => _BookServiceState();
}

class _BookServiceState extends State<BookService> {
  List<String> t = List<String>();
  List<String> ti = List<String>();
  List<String> tim = List<String>();
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
    backgroundColor: Colors.indigoAccent,
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
      appBar: AppBar(
        title: Text('Washing Car'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            //decoration: BoxDecoration(
            //image: DecorationImage(
            //image: AssetImage('images/amine.jpeg'), fit: BoxFit.cover)),
            child: SingleChildScrollView(
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
                                color: Colors.black, // Set border color
                                width: 3.0), // Set border width
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0)), // Set rounded corner radius
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black,
                                  offset: Offset(1, 3))
                            ] // Make rounded corner of border
                            ),
                        child: Text(
                          "Choose your vehicle",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, right: 15.0, left: 15.0),
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
                                isSelected[buttonIndex] =
                                    !isSelected[buttonIndex];
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
                                color: Colors.black, // Set border color
                                width: 3.0), // Set border width
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0)), // Set rounded corner radius
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black,
                                  offset: Offset(1, 3))
                            ] // Make rounded corner of border
                            ),
                        child: Text(
                          "Select Date & Time",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
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
                        child: Text(
                          "12 Slots",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        margin: EdgeInsets.only(right: 280, left: 0),
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            border: Border.all(
                                color: Colors.black, // Set border color
                                width: 3.0), // Set border width
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0)), // Set rounded corner radius
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
                      selectedBorderColor: Colors.blue,
                      children: [
                        Text(
                          '     09:00 AM     ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '     10:00 AM     ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '     11:00 AM     ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '     12:00 AM     ',
                          style: TextStyle(color: Colors.black),
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
                              _isSelected1[buttonIndex] =
                                  !_isSelected1[buttonIndex];
                            } else {
                              _isSelected1[buttonIndex] = false;
                            }
                          }
                        });
                      },
                    ),
                  ),
                  ToggleButtons(
                    selectedBorderColor: Colors.blue,
                    children: [
                      Text(
                        '     01:00 PM     ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '     02:00 PM     ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '     03:00 PM     ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '     04:00 PM     ',
                        style: TextStyle(color: Colors.black),
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
                            _isSelected2[buttonIndex] =
                                !_isSelected2[buttonIndex];
                          } else {
                            _isSelected2[buttonIndex] = false;
                          }
                        }
                      });
                    },
                  ),
                  ToggleButtons(
                    selectedBorderColor: Colors.blue,
                    children: [
                      Text(
                        '     05:00 PM     ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '     06:00 PM     ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '     07:00 PM     ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '     08:00 PM     ',
                        style: TextStyle(color: Colors.black),
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
                            _isSelected3[buttonIndex] =
                                !_isSelected3[buttonIndex];
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
                          String gender() {
                            if (isSelected.toString() ==
                                '[true, false, false, false]') {
                              return 'car';
                            }
                            if (isSelected.toString() ==
                                '[false, true, false, false]') {
                              return 'bus';
                            }
                            if (isSelected.toString() ==
                                '[false, false, true, false]') {
                              return 'track';
                            }
                            if (isSelected.toString() ==
                                '[false, false, false, true]') {
                              return 'motor';
                            }
                          }

                          List<String> time() {
                            if (_isSelected1.toString() ==
                                '[true, false, false, false]') {
                              t.add('09:00 AM');
                            }
                            if (_isSelected1.toString() ==
                                '[false, true, false, false]') {
                              t.add('10:00 AM');
                            }
                            if (_isSelected1.toString() ==
                                '[false, false, true, false]') {
                              t.add('11:00 AM');
                            }
                            if (_isSelected1.toString() ==
                                '[false, false, false, true]') {
                              t.add('12:00 AM');
                            }
                            return t;
                          }

                          List<String> time2() {
                            if (_isSelected2.toString() ==
                                '[true, false, false, false]') {
                              ti.add('01:00 PM');
                            }
                            if (_isSelected2.toString() ==
                                '[false, true, false, false]') {
                              ti.add('02:00 PM');
                            }
                            if (_isSelected2.toString() ==
                                '[false, false, true, false]') {
                              ti.add('03:00 PM');
                            }
                            if (_isSelected2.toString() ==
                                '[false, false, false, true]') {
                              ti.add('04:00 PM');
                            }
                            return ti;
                          }

                          List<String> time3() {
                            if (_isSelected3.toString() ==
                                '[true, false, false, false]') {
                              tim.add('05:00 PM');
                            }
                            if (_isSelected3.toString() ==
                                '[false, true, false, false]') {
                              tim.add('06:00 PM');
                            }
                            if (_isSelected3.toString() ==
                                '[false, false, true, false]') {
                              tim.add('07:00 PM');
                            }
                            if (_isSelected3.toString() ==
                                '[false, false, false, true]') {
                              tim.add('08:00 PM');
                            }
                            return tim;
                          }

                          Map creds = {
                            'gender': gender(),
                            'day': _selectedDay.toString(),
                            'time': time() + time2() + time3()
                          };
                          Provider.of<Auth>(context, listen: false)
                              .store(creds: creds);
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Wash_services()));
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
