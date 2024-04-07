//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabbedScreen(),
    );
  }
}

class MyTabbedScreen extends StatefulWidget {
  @override
  _MyTabbedScreenState createState() => _MyTabbedScreenState();
}

class _MyTabbedScreenState extends State<MyTabbedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Color background = const Color(0xFFFCF4F4);
  Color maroon = const Color(0xFFc00100);
  Color dark_maroon = const Color(0xFF850808);

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
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Upcoming'),
            Tab(text: 'Pending'),
            Tab(text: 'Past'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Appointment with Dr. Zachary Maina',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
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
                              Text('Details ',
                                  style: TextStyle(
                                    fontSize: 12,
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
                    SizedBox(
                      height: 5,
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
                              'Send a message',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Appointment with Dr. Mark Oloo',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
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
                              Text('Details ',
                                  style: TextStyle(
                                    fontSize: 12,
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
                    SizedBox(
                      height: 5,
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
                              'Send a message',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Appointment with Dr. Zachary Maina',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
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
                        SizedBox(width: 20),
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
                    SizedBox(height: 5),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Row(
                            children: [
                              Text('Details ',
                                  style: TextStyle(
                                    fontSize: 12,
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
                    SizedBox(
                      height: 5,
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
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Appointment with Dr. Zachary Maina',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
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
                        SizedBox(width: 20),
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
                    SizedBox(height: 5),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Row(
                            children: [
                              Text('Details ',
                                  style: TextStyle(
                                    fontSize: 12,
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
                    SizedBox(
                      height: 5,
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
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
