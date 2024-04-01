import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../data/sp_helper.dart';
import '../data/session.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => __SessionsScreenState();
}

class __SessionsScreenState extends State<SessionsScreen> {
  List<Session> sessions = [];
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SPHelper helper = SPHelper();

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Training Sessions '),
      ),
      body: ListView(children: getContent()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showSessionDialog(context);
        },
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Insert Training Session'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: txtDescription,
                  decoration: InputDecoration(hintText: 'Description'),
                ),
                TextField(
                  controller: txtDuration,
                  decoration: InputDecoration(hintText: 'Duration'),
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Session Time'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
                txtDescription.text = '';
                txtDuration.text = '';
              },
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: saveSession,
            ),
          ],
        );
      },
    );
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year} - ${now.month} - ${now.day}';
    int id = helper.getCounter() + 1;
    Session newSession = Session(
        id, today, txtDescription.text, int.tryParse(txtDuration.text) ?? 0);
    helper.writeSession(newSession).then((_) {
      updateScreen();
      helper.setCounter();
    });
    txtDescription.text = '';
    txtDuration.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    sessions.forEach((session) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          helper.deleteSession(session.id).then((value) => updateScreen());
        },
        child: ListTile(
          title: Text(session.description),
          subtitle: Text('${session.date}- duration: ${session.duration} min'),
        ),
      ));
    });
    return tiles;
  }

  void updateScreen() {
    sessions = helper.getSessions();
    setState(() {});
  }
}
