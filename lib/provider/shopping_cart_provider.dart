import 'package:flutter/foundation.dart';

class ShoppingCartProvider with ChangeNotifier {
  void onShoppingCartChange() {
    notifyListeners();
  }
}
