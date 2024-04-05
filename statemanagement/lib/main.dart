import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

part 'main.g.dart';

void main() {
  runApp(const App());
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

final Set<String> tags = {"all", "nature", "cat"};

class GalleryStore = GalleryStoreBase with _$GalleryStore;
var galleryStore = GalleryStore();

abstract class GalleryStoreBase with Store {
  @observable
  var isTagging = false;

  @observable
  var photoStates =
      List.of(urls.map((url) => Observable(PhotoState(url: url, tags: {}))));

  @action
  void toggleTagging(String? url) {
    isTagging = !isTagging;
    for (var ps in photoStates) {
      if (isTagging && ps.value.url == url) {
        ps.value.selected = true;
      } else {
        ps.value.selected = false;
      }
      ps.reportChanged();
    }
  }

  @action
  void onPhotoSelect(String url, bool selected) {
    for (var ps in photoStates) {
      if (ps.value.url == url) {
        ps.value.selected = selected;
        ps.reportChanged();
      }
    }
  }

  @action
  void selectTag(String tag) {
    if (isTagging) {
      if (tag != "all") {
        for (var ps in photoStates) {
          if (ps.value.selected == true) {
            ps.value.tags.add(tag);
            ps.reportChanged();
          }
        }
      }
      toggleTagging(null);
    } else {
      for (var ps in photoStates) {
        ps.value.display = tag == "all" ? true : ps.value.tags.contains(tag);
        ps.reportChanged();
      }
    }
  }
}

class GalleryPage extends StatelessWidget {
  final String title = 'Image Gallery';

  const GalleryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Observer(
        builder: (_) => GridView.count(
            primary: false,
            crossAxisCount: 2,
            children: List.of(galleryStore.photoStates
                .where((ps) => ps.value.display)
                .map((ps) => Photo(
                    state: ps.value,
                    selectable: galleryStore.isTagging,
                    onLongPress: galleryStore.toggleTagging,
                    onSelect: galleryStore.onPhotoSelect)))),
      ),
      drawer: Drawer(
        child: ListView(
          children: List.of(tags.map((t) => ListTile(
                title: Text(t),
                onTap: () {
                  galleryStore.selectTag(t);
                  Navigator.of(context).pop();
                },
              ))),
        ),
      ),
    );
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
