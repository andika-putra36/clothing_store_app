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
      Uri url = Uri.parse(ApiConstant.getProducts);

      final httpResponse = await http.get(url);
      final decoded = json.decode(httpResponse.body);
      final dataResponse = decoded['data'] as List;

      for (var value in dataResponse) {
        _products.add(
          Product(
            id: value['id'],
            productCategoryId: value['product_category_id'],
            productCategoryName: value['product_category_name'],
            name: value['name'],
            description: value['description'],
            price: value['price'],
            isAvailable: value['is_available'],
            isDelete: value['is_delete'],
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
}
