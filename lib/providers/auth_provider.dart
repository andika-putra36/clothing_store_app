import 'dart:convert';

import 'package:clothing_store_app/constants/api_constant.dart';
import 'package:clothing_store_app/models/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  SignInResponse? _signInResponse;
  SignInResponse? get signInResponse => _signInResponse;
  final _secureStorage = FlutterSecureStorage();

  Future<void> signIn(SignInRequest request) async {
    try {
      print('signIn(request)');
      Uri url = Uri.parse(ApiConstant.signIn);

      final httpResponse = await http.post(
        url,
        body: json.encode({
          'email': request.email,
          'password': request.password,
        }),
      );
      final decoded = json.decode(httpResponse.body);
      final dataResponse = decoded["data"] as Map<String, dynamic>;
      final dataResponseSignInToken =
          dataResponse["token"] as Map<String, dynamic>;
      final dataResponseSignInUser =
          dataResponse["user"] as Map<String, dynamic>;

      _signInResponse = SignInResponse(
        signInToken: SignInToken(
          accessToken: dataResponseSignInToken["access_token"] as String?,
          refreshToken: dataResponseSignInToken["refresh_token"] as String?,
        ),
        signInUser: SignInUser(
          userId: dataResponseSignInUser["user_id"] as int?,
          roleId: dataResponseSignInUser["role_id"] as int?,
          email: dataResponseSignInUser["email"] as String?,
          customerId: dataResponseSignInUser["customer_id"] as int?,
          adminId: dataResponseSignInUser["admin_id"] as int?,
        ),
      );

      await saveToSecureStorage();

      notifyListeners();
    } catch (e) {
      // print(e);
    }
  }

  Future<void> saveToSecureStorage() async {
    final token = _signInResponse?.signInToken;
    final user = _signInResponse?.signInUser;

    await _secureStorage.write(
      key: 'token',
      value: json.encode({
        'access_token': token?.accessToken,
        'refresh_token': token?.refreshToken,
      }),
    );
    await _secureStorage.write(
      key: 'user',
      value: json.encode({
        'user_id': user?.userId,
        'role_id': user?.roleId,
        'email': user?.email,
        'customer_id': user?.customerId,
        'admin_id': user?.adminId,
      }),
    );
  }

  Future<void> signOut() async {
    _signInResponse = null;
    await _secureStorage.deleteAll();
    notifyListeners();
  }
}
