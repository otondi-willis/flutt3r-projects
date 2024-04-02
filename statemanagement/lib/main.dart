import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GalleryModel(),
      child: const App(),
    ),
  );
}

const List<String> urls = [
  'https://live.staticflickr.com/65535/50489498856_67fbe52703_b.jpg',
  "https://live.staticflickr.com/7372/12502775644_acfd415fa7_w.jpg",
  "https://live.staticflickr.com/7372/12502775644_acfd415fa7_w.jpg",
  "https://live.staticflickr.com/7372/12502775644_acfd415fa7_w.jpg"
];

class PhotoState {
  String url;
  bool selected = false;
  bool display = true;
  Set<String> tags = {};

  PhotoState(
      {required this.url,
      this.selected = false,
      this.display = true,
      required this.tags});
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'PhotoViewer', home: GalleryPage());
  }
}

class GalleryModel extends ChangeNotifier {
  bool isTagging = false;
  List<PhotoState> photoStates =
      List.of(urls.map((url) => PhotoState(url: url, tags: {})));
  Set<String> tags = {"all", "nature", "cat"};

  void toggleTagging(String? url) {
    isTagging = !isTagging;
    for (var ps in photoStates) {
      if (isTagging && ps.url == url) {
        ps.selected = true;
      } else {
        ps.selected = false;
      }
    }
    notifyListeners();
  }

  void onPhotoSelect(String url, bool selected) {
    for (var ps in photoStates) {
      if (ps.url == url) {
        ps.selected = selected;
      }
    }
    notifyListeners();
  }

  void selectTag(String tag) {
    if (isTagging) {
      if (tag != "all") {
        for (var ps in photoStates) {
          if (ps.selected == true) {
            ps.tags.add(tag);
          }
        }
      }
      toggleTagging(null);
    } else {
      for (var ps in photoStates) {
        ps.display = tag == "all" ? true : ps.tags.contains(tag);
      }
    }

    notifyListeners();
  }
}

class GalleryPage extends StatelessWidget {
  final String title = 'Image Gallery';

  const GalleryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryModel>(builder: (context, gallery, child) {
      return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: GridView.count(
          primary: false,
          crossAxisCount: 2,
          children: List.of(gallery.photoStates.where((ps) => ps.display).map(
              (ps) => Photo(
                  state: ps,
                  selectable: gallery.isTagging,
                  onLongPress: gallery.toggleTagging,
                  onSelect: gallery.onPhotoSelect))),
        ),
        drawer: Drawer(
          child: ListView(
            children: List.of(gallery.tags.map((t) => ListTile(
                  title: Text(t),
                  onTap: () {
                    gallery.selectTag(t);
                    Navigator.of(context).pop();
                  },
                ))),
          ),
        ),
      );
    });
  }
}

class Photo extends StatelessWidget {
  final PhotoState state;
  final bool selectable;
  final Function onLongPress;
  final Function onSelect;

  const Photo(
      {super.key,
      required this.state,
      required this.selectable,
      required this.onLongPress,
      required this.onSelect});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      GestureDetector(
          child: Image.network(state.url),
          onLongPress: () => onLongPress(state.url)),
    ];
    if (selectable) {
      children.add(Positioned(
          left: 20,
          top: 0,
          child: Theme(
            data: Theme.of(context)
                .copyWith(unselectedWidgetColor: Colors.grey[200]),
            child: Checkbox(
              onChanged: (value) {
                onSelect(state.url, value);
              },
              value: state.selected,
              activeColor: Colors.white,
              checkColor: Colors.black,
            ),
          )));
    }
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        alignment: Alignment.center,
        children: children,
      ),
    );
  }
}
