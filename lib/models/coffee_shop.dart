import 'package:flutter/material.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  // coffee for sale list
  final List<Coffee> _shop = [
    // black coffee
    Coffee(
      name: 'Long Blac',
      price: "4.10",
      imagePath: "lib/images/coffee.png",
    ),

    // iced coffee
    Coffee(
      name: 'Ice Coffee',
      price: "4.20",
      imagePath: "lib/images/iced-coffee.png",
    ),

    // hot coffee
    Coffee(
      name: 'Hot Coffee',
      price: "4.10",
      imagePath: "lib/images/hot-coffee.png",
    ),

    // bubble tea
    Coffee(
      name: 'Bubble Tea',
      price: "4.15",
      imagePath: "lib/images/bubble-tea.png",
    ),
  ];

  // user cart
  List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add items to the cart
  void addItemsToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove items from the cart
  void removeItemsFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
