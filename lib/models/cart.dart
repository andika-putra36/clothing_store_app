class Cart {
  final CartPricing? cartPricing;
  final List<CartProduct>? cartProducts;

  Cart({this.cartPricing, this.cartProducts});
}

class CartPricing {
  final double? subtotal;
  final double? applicationFee;
  final double? total;

  CartPricing({this.subtotal, this.applicationFee, this.total});
}

class CartProduct {
  final int? id;
  final int? productCategoryId;
  final String? productCategoryName;
  final String? name;
  final String? description;
  final double? price;

  CartProduct({
    this.id,
    this.productCategoryId,
    this.productCategoryName,
    this.name,
    this.description,
    this.price,
  });
}
