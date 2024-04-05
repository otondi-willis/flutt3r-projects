// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GalleryStore on GalleryStoreBase, Store {
  late final _$isTaggingAtom =
      Atom(name: 'GalleryStoreBase.isTagging', context: context);

  @override
  bool get isTagging {
    _$isTaggingAtom.reportRead();
    return super.isTagging;
  }

  @override
  set isTagging(bool value) {
    _$isTaggingAtom.reportWrite(value, super.isTagging, () {
      super.isTagging = value;
    });
  }

  late final _$photoStatesAtom =
      Atom(name: 'GalleryStoreBase.photoStates', context: context);

  @override
  List<Observable<PhotoState>> get photoStates {
    _$photoStatesAtom.reportRead();
    return super.photoStates;
  }

  @override
  set photoStates(List<Observable<PhotoState>> value) {
    _$photoStatesAtom.reportWrite(value, super.photoStates, () {
      super.photoStates = value;
    });
  }

  late final _$GalleryStoreBaseActionController =
      ActionController(name: 'GalleryStoreBase', context: context);

  @override
  void toggleTagging(String? url) {
    final _$actionInfo = _$GalleryStoreBaseActionController.startAction(
        name: 'GalleryStoreBase.toggleTagging');
    try {
      return super.toggleTagging(url);
    } finally {
      _$GalleryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPhotoSelect(String url, bool selected) {
    final _$actionInfo = _$GalleryStoreBaseActionController.startAction(
        name: 'GalleryStoreBase.onPhotoSelect');
    try {
      return super.onPhotoSelect(url, selected);
    } finally {
      _$GalleryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectTag(String tag) {
    final _$actionInfo = _$GalleryStoreBaseActionController.startAction(
        name: 'GalleryStoreBase.selectTag');
    try {
      return super.selectTag(tag);
    } finally {
      _$GalleryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isTagging: ${isTagging},
photoStates: ${photoStates}
    ''';
  }
}
