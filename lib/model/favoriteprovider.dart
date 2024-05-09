import 'package:flutter/foundation.dart';

import 'foodinfo.dart';

class Favprovider extends ChangeNotifier {
  final List<Food> _Detailslist = [];
  final List<Food> _favcart = [];
  List<Food> get Detailslist => _Detailslist;
  List<Food> get favcart => _favcart;

  void addTofav(Food fooditem) {
    _favcart.add(Food(
        price: fooditem.price,
        imagepath: fooditem.imagepath,
        name: fooditem.name,
        id: fooditem.id));
    notifyListeners();
  }

  void removeToFav(Food food) {
    _favcart.remove(food);
    // var ind = _favcart.indexOf(food);
    // _favcart.removeAt(ind);

    notifyListeners();
  }
}
