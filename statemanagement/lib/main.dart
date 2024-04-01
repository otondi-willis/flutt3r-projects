import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

const List<String> urls = [
  "https://live.staticflickr.com/7372/12502775644_acfd415fa7_w.jpg",
  "https://live.staticflickr.com/7372/12502775644_acfd415fa7_w.jpg",
  "https://live.staticflickr.com/7372/12502775644_acfd415fa7_w.jpg",
  "https://live.staticflickr.com/7372/12502775644_acfd415fa7_w.jpg"
];

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Photo Viewer',
        home: GaleryPage(title: 'Image Gallery', urls: urls));
  }
}

class GaleryPage extends StatelessWidget {
  final String title;
  final List<String> urls;

  const GaleryPage({super.key, required this.title, required this.urls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: GridView.count(
        primary: false,
        crossAxisCount: 2,
        children: List.of(urls.map((url) => Photo(url: url))),
      ),
    );
  }
}

class Photo extends StatelessWidget {
  const Photo({super.key, required this.url});

  final url;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Image.network(url),
    );
  }
}
