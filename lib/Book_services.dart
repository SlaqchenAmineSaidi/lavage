import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookService extends StatefulWidget {
  const BookService({Key key}) : super(key: key);

  @override
  _BookServiceState createState() => _BookServiceState();
}

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class _BookServiceState extends State<BookService> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  DateTime _rangeStart;
  DateTime _rangeEnd;
  ValueNotifier<List<Event>> _selectedEvents;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime start, DateTime end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

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
                        SelectIntent();
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
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
