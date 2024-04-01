import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Photo Viewer', home: Photo());
  }
}

class Photo extends StatelessWidget {
  const Photo({super.key});

  final url =
      'https://live.staticflickr.com/65535/50489498856_67fbe52703_b.jpg';

  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }
}
