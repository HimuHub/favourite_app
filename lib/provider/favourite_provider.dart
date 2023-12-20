import 'package:flutter/material.dart';

class FavouriteItemProvider with ChangeNotifier {
  List<int> _slecteditem = [];

  List<int> get slecteditem => _slecteditem;

  void additem(int value) {
    _slecteditem.add(value);
    notifyListeners();
  }

  void removeitem(int value) {
    _slecteditem.remove(value);
    notifyListeners();
  }
}
