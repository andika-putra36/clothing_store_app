import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api_constant.dart';
import '../models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> getProducts() async {
    _products.clear();
    try {
      print('getProducts()');
      Uri url = Uri.parse(ApiConstant.getProducts);

      final httpResponse = await http.get(url);
      final decoded = json.decode(httpResponse.body);
      final dataResponse = decoded['data'] as List;
      print(dataResponse);

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
      print(e);
    }
  }
}
