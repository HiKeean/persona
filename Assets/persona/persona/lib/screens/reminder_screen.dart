import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:persona/screens/add_event_screen.dart';
import 'package:persona/screens/eventList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late Map<DateTime, List<Event>> selectedEvents = {};
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  TextEditingController _eventController = TextEditingController();

void initState() {
  super.initState();
  initializeSelectedEvents();
}

Future<void> initializeSelectedEvents() async {
  try {
    Map<DateTime, List<Event>> events = await get();
    setState(() {
      selectedEvents = events;
    });
  } catch (e) {
    print('Error initializing selectedEvents: $e');
    // Handle the error gracefully
  }
}

Future<Map<DateTime, List<Event>>> get() async {
  final response = await http.get(Uri.parse('http://10.10.6.39/flutterapi/crudflutter/read1.php'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    for (var item in data) {
      DateTime temp_date = DateTime.parse(item['eventDate']);

      DateTime eventDate = DateTime(
              temp_date.year,
              temp_date.month,
              temp_date.day,
      );
      
      Event newEvent = Event(
        title: item['title'],
        time: item['time'],
        location: item['location'],
        reminder: item['reminder'],
        notes: item['notes'],
        date: eventDate,
      );

      if (selectedEvents.containsKey(eventDate)) {
        bool eventExists = selectedEvents[eventDate]!.any((event) =>
            event.time == newEvent.time &&
            event.title == newEvent.title &&
            event.location == newEvent.location &&
            event.reminder == newEvent.reminder &&
            event.notes == newEvent.notes);

        if (!eventExists) {
          selectedEvents[eventDate]!.add(newEvent);
        }
      } else {
        selectedEvents[eventDate] = [newEvent];
      }
    }



    return selectedEvents;
  } else {
    throw Exception('Failed to fetch events');
  }
}


  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/home');
          break;
        case 1:
          Navigator.pushNamed(context, '/reminder');
          break;
        case 2:
          Navigator.pushNamed(context, '/learning');
          break;
        case 3:
          Navigator.pushNamed(context, '/profile');
          break;
      }
    }
  }

  Widget BottomNavBar() {
    return CustomLineIndicatorBottomNavbar(
      selectedColor: Color(0xff7da0ca),
      unSelectedColor: Colors.black54,
      backgroundColor: Colors.white,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      enableLineIndicator: true,
      lineIndicatorWidth: 3,
      indicatorType: IndicatorType.Top,
      customBottomBarItems: [
        CustomBottomBarItems(
          label: 'Home',
          icon: Icons.home,
        ),
        CustomBottomBarItems(
          label: 'Reminder',
          icon: CupertinoIcons.bell_fill,
        ),
        CustomBottomBarItems(
          label: 'Learning',
          icon: CupertinoIcons.book_solid,
        ),
        CustomBottomBarItems(
          label: 'Profile',
          icon: Icons.person_rounded,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("personA"),
        centerTitle: true,
        backgroundColor: Color(0xff7da0ca),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
            },
            selectedDayPredicate: (DateTime date) {
              DateTime now = DateTime.now();
              bool isToday = isSameDay(now, date); // Check if the date is today

              if (isToday) {
                return false; // Skip checking events for today
              }

              bool hasEvents = selectedEvents.keys
                  .any((eventDate) => isSameDay(eventDate, date));
              bool isSelectedDay = isSameDay(selectedDay, date);

              return hasEvents || isSelectedDay;
            },
            eventLoader: _getEventsfromDay,
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Color(0xff7da0ca),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendTextStyle: TextStyle(
                color: Colors.red,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Color(0xff7da0ca),
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          SizedBox(height: 20),
          Column(
            children: selectedEvents.entries.map((entry) {
              final date = entry.key;
              final events = entry.value;
              final focus_day = focusedDay.toString().replaceAll("Z", "");
              final date_now = date.toString();

              if (focus_day == date_now) {
                return EventListWidget(events: events);
              } else {
                return SizedBox();
              }
            }).toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xff7da0ca),
        onPressed: () async {
          Event? newEvent = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddEventScreen(selectedDay: selectedDay)),
          );

          if (newEvent != null) {
            DateTime eventDate = DateTime(
              newEvent.date!.year,
              newEvent.date!.month,
              newEvent.date!.day,
            );

            setState(() {
              DateTime eventDate = DateTime(
                newEvent.date.year,
                newEvent.date.month,
                newEvent.date.day,
              );

              if (selectedEvents.containsKey(eventDate)) {
                bool eventExists = selectedEvents[eventDate]!.any((event) =>
                    event.time == newEvent.time &&
                    event.title == newEvent.title &&
                    event.location == newEvent.location &&
                    event.reminder == newEvent.reminder &&
                    event.notes == newEvent.notes);

                if (!eventExists) {
                  selectedEvents[eventDate]!.add(newEvent);
                }
              } else {
                selectedEvents[eventDate] = [newEvent];
              }
            });
          }
        },
        label: Text("Add Event"),
        icon: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
