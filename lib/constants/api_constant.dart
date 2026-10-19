class ApiConstant {
  static const String baseUrl = 'http://10.0.2.2:8888/api/v1';
  static const String getProducts = '$baseUrl/products';
  static const String getProduct = '$baseUrl/products/:id';

  static const String getCart = '$baseUrl/cart';

  static const String signIn = '$baseUrl/auth/login';
  static const String refreshToken = '$baseUrl/auth/refresh-token';
}
