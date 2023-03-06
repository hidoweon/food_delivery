import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/models/products_models.dart';
import 'package:get/get.dart';

import '../models/cart_models.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModels> _items = {};

  void addItem(ProductModels product, int quantity) {
    var totalQuantity = 0;

    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {

        totalQuantity = value.quantity! + quantity;

        return CartModels(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString());
      });

      if(totalQuantity <= 0){
        _items.remove(product.id);
      }

    } else {
      if(quantity > 0){
        _items.putIfAbsent(product.id!, () {
          _items.forEach((key, value) {});

          return CartModels(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
          );
        });
      }else{
        Get.snackbar("Item Count", "Add something in your cart",
            backgroundColor: Colors.blue,
            colorText: Colors.white);
      }
    }
  }

  bool existInCart(ProductModels product){
    if(_items.containsKey(product.id!)){
      return true;
    }
    return false;
  }

  int getQuantity(ProductModels product){
    var quantity = 0;

    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key == product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems{
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity = totalQuantity + value.quantity!;
    });
    return totalQuantity;
  }
}
