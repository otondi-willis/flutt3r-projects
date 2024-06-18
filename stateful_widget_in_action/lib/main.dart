import 'package:flutter/material.dart';

final Color darkBlue = Colors.grey;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: HelloYou(),
        ),
      ),
    );
  }
}

class HelloYou extends StatefulWidget {
  @override
  _HelloYouState createState() => _HelloYouState();
}

class _HelloYouState extends State<HelloYou>{
  String name = '';
  final TextEditingController txtName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      TextField(
      controller: txtName,),
      ElevatedButton(
      child: Text('Say Hello'),
      onPressed: (){
        setState ((){
          name = txtName.text;
        });
      },),
      Text('Hello ' + name),
    ],);
  }
}
