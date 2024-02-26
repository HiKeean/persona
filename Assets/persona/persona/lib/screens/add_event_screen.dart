// import 'package:persona/screens/event_calender.dart';
import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:intl/intl.dart';

class AddEventScreen extends StatefulWidget {
  final DateTime selectedDay; // Define selectedDay as a parameter

  AddEventScreen({required this.selectedDay});
  @override
  _AddEventState createState() => _AddEventState();
}

class Event {
  String title;
  String time;
  String location;
  String reminder;
  String notes;
  DateTime date;

  Event({
    required this.title,
    required this.time,
    required this.location,
    required this.reminder,
    required this.notes,
    required this.date,
  });
}

class _AddEventState extends State<AddEventScreen> {
  TextEditingController timeinput = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  String? selectedValue;

  final List<String> items = [
    '5 Menit Sebelum',
    '10 Menit Sebelum',
    '15 Menit Sebelum',
    '20 Menit Sebelum',
    '30 Menit Sebelum',
  ];

  void initState() {
    timeinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("personA"),
        backgroundColor: Color(0xff7da0ca),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bghome.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Judul:',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: timeinput,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.access_time_outlined),
                    labelText: "Masukkan Jam",
                  ),
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );

                    if (pickedTime != null) {
                      DateTime parsedTime = DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );

                      String formattedTime =
                          DateFormat('HH:mm').format(parsedTime);

                      setState(() {
                        timeinput.text = formattedTime;
                      });
                    }
                  },
                ),
                SizedBox(height: 25),
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    labelText: 'Lokasi:',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(
                      'Pengingat',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map(
                          (String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    style: const TextStyle(fontSize: 14),
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 2,
                    ),
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: notesController,
                  decoration: InputDecoration(
                    labelText: 'Catatan:',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                  ),
                  maxLines: 5,
                  minLines: 1,
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Kembali"),
                    ),
                    ElevatedButton(
                      child: const Text("Simpan"),
                      onPressed: () {
                        Event newEvent = Event(
                          title: titleController.text,
                          time: timeinput.text,
                          location: locationController.text,
                          reminder: selectedValue ?? '',
                          notes: notesController.text,
                          date: widget.selectedDay,
                          
                        
                        );

                        Navigator.pop(context, newEvent);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
