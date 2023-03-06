import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:food_delivery/models/products_models.dart';
import 'package:flutter/material.dart';


class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<ProductModels> _popularProductList = [];
  List<ProductModels> get popularProductList => _popularProductList;

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems+_quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if(response.statusCode == 200){
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }
  }

  //음식 수 계산
  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity+1);
    }else{
      _quantity = checkQuantity(_quantity-1);
    }
    update();
  }

  //0보다 작을 시 혹은 20보다 클때 경고
  int checkQuantity(int quantity){
    if(_inCartItems + quantity < 0){
      Get.snackbar("Item Count", "You can't reduce more!",
      backgroundColor: Colors.blue,
      colorText: Colors.white);
      return 0;
    }else if(_inCartItems + quantity > 20){
      Get.snackbar("Item Count", "You can't add more!",
          backgroundColor: Colors.blue,
          colorText: Colors.white);
      return 20;
    }else{
      return quantity;
    }
  }

  //quantity라는 변수가 글로벌이기 때문에 초기화 과정
  void initProduct(ProductModels product, CartController cart){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);

    _inCartItems = _cart.getQuantity(product);


    //get from storage _inCartItems
  }

  void addItem(ProductModels product){
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _inCartItems = _cart.getQuantity(product);
      update();

  }

  int get totalItems{
    return _cart.totalItems;
  }
}