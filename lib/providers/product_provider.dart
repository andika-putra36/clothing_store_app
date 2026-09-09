import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api_constant.dart';
import '../models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  Product? _product;

  List<Product> get products => _products;
  int get countProducts => _products.length;
  Product? get product => _product;

  Future<void> getProducts() async {
    _products.clear();
    try {
      // print('getProducts()');
      Uri url = Uri.parse(ApiConstant.getProducts);

      final httpResponse = await http.get(url);
      final decoded = json.decode(httpResponse.body);
      final dataResponse = decoded['data'] as List;
      // print(dataResponse);

      for (var value in dataResponse) {
        _products.add(
          Product(
            id: value['id'] as int?,
            productCategoryId: value['product_category_id'] as int?,
            productCategoryName: value['product_category_name'] as String?,
            name: value['name'] as String?,
            description: value['description'] as String?,
            price: (value['price'] as num?)?.toDouble(),
            isAvailable: value['is_available'] as bool?,
            isDelete: value['is_delete'] as bool?,
            createdAt: DateTime.parse(value['created_at']),
            updatedAt: DateTime.parse(value['updated_at']),
          ),
        );
      }
      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }

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
}
