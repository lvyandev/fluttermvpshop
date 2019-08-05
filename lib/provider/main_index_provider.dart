import 'package:flutter/foundation.dart';

class MainIndexProvider with ChangeNotifier {
  int currentIndex = 0;

  void setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
