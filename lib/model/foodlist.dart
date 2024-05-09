import 'package:flutter/cupertino.dart';
import 'foodinfo.dart';

class Shop extends ChangeNotifier {
  final List<Food> _Detailslist = [];
  List<Food> _cart = [];
  List<Food> get Detailslist => _Detailslist;
  List<Food> get cart => _cart;

  void addtoCart(Food fooditem, int quantity) {
    _cart.add(
      Food(
        price: fooditem.price,
        imagepath: fooditem.imagepath,
        name: fooditem.name,
        qty: quantity,
        id: fooditem.id,
      ),
    );

    notifyListeners();
  }

  void removetoCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
