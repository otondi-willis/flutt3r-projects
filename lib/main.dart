import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppointmentScreen(),
    );
  }
}

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now().replacing(minute: 0);
  TimeOfDay selectedEndTime =
      TimeOfDay.now().replacing(minute: 0, hour: TimeOfDay.now().hour + 1);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  String formatTime(TimeOfDay time) {
    return DateFormat.jm()
        .format(DateTime(2024, 5, 10, time.hour, time.minute));
  }

  String formatDate(DateTime date) {
    return DateFormat('E, d\'${_getDaySuffix(date.day)}\' MMM yyyy')
        .format(date);
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showDialog<TimeOfDay>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Start Time'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller:
                    TextEditingController(text: formatTime(selectedStartTime)),
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Select Time',
                  prefixIcon: Icon(Icons.access_time),
                ),
                onTap: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: selectedStartTime,
                  );
                  if (picked != null && picked != selectedStartTime)
                    setState(() {
                      selectedStartTime = picked;
                      selectedEndTime = TimeOfDay(
                          hour: picked.hour + 2, minute: picked.minute);
                    });
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(selectedStartTime);
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
    if (picked != null && picked != selectedStartTime)
      setState(() {
        selectedStartTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Equity Afia - Ruiru',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 10,
                      ),
                      SizedBox(width: 5),
                      Text('${formatDate(selectedDate)}',
                          style: TextStyle(
                            fontSize: 10,
                          )),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () => _selectStartTime(context),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 10,
                      ),
                      SizedBox(width: 3),
                      Text(
                          '${formatTime(selectedStartTime)} - ${formatTime(selectedEndTime)}',
                          style: TextStyle(
                            fontSize: 10,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Row(
                    children: [
                      Text('${formatDate(selectedDate)}',
                          style: TextStyle(
                            fontSize: 10,
                          )),
                      Icon(
                        Icons.info_outline,
                        size: 13,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xFFc00100),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'View Details',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
