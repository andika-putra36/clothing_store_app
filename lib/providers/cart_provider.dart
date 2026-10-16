import 'dart:convert';

import 'package:clothing_store_app/constants/api_constant.dart';
import 'package:clothing_store_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CartProvider with ChangeNotifier {
  Cart? _cart;
  Cart? get cart => _cart;

  Future<void> getCart(int id) async {
    try {
      // print('getCart(id)');
      Uri url = Uri.parse(ApiConstant.getCart);

      final httpResponse = await http.get(url);
      final decoded = json.decode(httpResponse.body);
      final dataResponse = decoded["data"] as Map<String, dynamic>;

      final dataResponseCartPricing =
          dataResponse["pricing"] as Map<String, dynamic>;
      final dataResponseCartProducts = dataResponse["products"] as List;

      _cart = Cart(
        cartPricing: CartPricing(
          subtotal: (dataResponseCartPricing['subtotal'] as num?)?.toDouble(),
          applicationFee: (dataResponseCartPricing['application_fee'] as num?)
              ?.toDouble(),
          total: (dataResponseCartPricing['total'] as num?)?.toDouble(),
        ),
      );

      for (var value in dataResponseCartProducts) {
        _cart!.cartProducts!.add(
          CartProduct(
            id: value['id'] as int?,
            productCategoryId: value['product_category_id'] as int?,
            productCategoryName: value['product_category_name'] as String?,
            name: value['name'] as String?,
            description: value['description'] as String?,
            price: (value['price'] as num?)?.toDouble(),
          ),
        );
      }
    } catch (e) {
      // print(e);
    }
  }

  /*
    Future<void> getProduct(int id) async {
    try {
      print('getProduct()');
      Uri url = Uri.parse(
        ApiConstant.getProduct.replaceAll(':id', id.toString()),
      );

      final httpResponse = await http.get(url);
      final decoded = json.decode(httpResponse.body);
      final dataResponse = decoded["data"] as Map<String, dynamic>;
      print(dataResponse);

      _product = Product(
        id: dataResponse['id'] as int?,
        productCategoryId: dataResponse['product_category_id'] as int?,
        productCategoryName: dataResponse['product_category_name'] as String?,
        name: dataResponse['name'] as String?,
        description: dataResponse['description'] as String?,
        price: (dataResponse['price'] as num?)?.toDouble(),
        isAvailable: dataResponse['is_available'] as bool?,
        isDelete: dataResponse['is_delete'] as bool?,
        createdAt: DateTime.parse(dataResponse['created_at']),
        updatedAt: DateTime.parse(dataResponse['updated_at']),
      );
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }
  */
}
