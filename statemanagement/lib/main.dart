import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:get/get.dart';

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

class GalleryController extends GetxController {
  var isTagging = false.obs;
  var photoStates =
      List.of(urls.map((url) => PhotoState(url: url, tags: {}).obs)).obs;
  Set<String> tags = {"all", "nature", "cat"};

  void toggleTagging(String? url) {
    isTagging.value = !isTagging.value;
    for (var ps in photoStates) {
      ps.update((ps) {
        if (isTagging.value && ps?.url == url) {
          ps?.selected = true;
        } else {
          ps?.selected = false;
        }
      });
    }
  }

  void onPhotoSelect(String url, bool selected) {
    for (var ps in photoStates) {
      ps.update((ps) {
        if (ps?.url == url) {
          ps?.selected = selected;
        }
      });
    }
  }

  void selectTag(String tag) {
    if (isTagging.value) {
      if (tag != "all") {
        for (var ps in photoStates) {
          if (ps.value.selected == true) {
            ps.update((ps) {
              ps?.tags.add(tag);
            });
          }
        }
      }
      toggleTagging(null);
    } else {
      for (var ps in photoStates) {
        ps.update((ps) {
          ps?.display = tag == "all" ? true : ps.tags.contains(tag);
        });
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
    final GalleryController c = Get.put(GalleryController());

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Obx(
        () => GridView.count(
            primary: false,
            crossAxisCount: 2,
            children: List.of(c.photoStates.where((ps) => ps.value.display).map(
                (ps) => Photo(
                    state: ps.value,
                    selectable: c.isTagging.value,
                    onLongPress: c.toggleTagging,
                    onSelect: c.onPhotoSelect)))),
      ),
      drawer: Drawer(
        child: ListView(
          children: List.of(c.tags.map((t) => ListTile(
                title: Text(t),
                onTap: () {
                  c.selectTag(t);
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
