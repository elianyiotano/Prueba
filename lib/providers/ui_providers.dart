import 'package:flutter/material.dart';

class UiProviders extends ChangeNotifier {
  int _selectedMenuOpt = 3;

  int get selectedMenuOpt {
    return this._selectedMenuOpt;
  }

  set selectedMenuOpt(int i) {
    this._selectedMenuOpt = i;
    notifyListeners();
  }
}
