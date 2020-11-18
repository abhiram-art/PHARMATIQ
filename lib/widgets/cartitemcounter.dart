import 'package:flutter/cupertino.dart';
import 'package:pharmatiq/config.dart';

class CartItemCounter extends ChangeNotifier
{
  int _counter = (EcommerceApp.cartList).length-1;
  int get count => _counter;
  Future<void>displayResult( )async {
    int _counter = (EcommerceApp.cartList).length - 1;
    await Future.delayed(const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }
}