class Product {
  final int? id;
  final int? productCategoryId;
  final String? productCategoryName;
  final String? name;
  final String? description;
  final double? price;
  final bool? isAvailable;
  final bool? isDelete;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Product({
    this.id,
    this.productCategoryId,
    this.productCategoryName,
    this.name,
    this.description,
    this.price,
    this.isAvailable,
    this.isDelete,
    this.createdAt,
    this.updatedAt,
  });
}
