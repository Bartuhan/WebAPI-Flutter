class Product {
  int? id;
  int? categoryId;
  String? productName;
  String? quantityPerUnit;
  double? unitsPrice;
  int? unitsInStock;

  Product(this.id, this.categoryId, this.productName, this.quantityPerUnit,
      this.unitsInStock, this.unitsPrice);

  Product.fromJson(Map json) {
    id = json["id"];
    categoryId = json["categoryId"];
    productName = json["productName"];
    quantityPerUnit = json["quantityPerUnit"];
    unitsPrice = json["unitsPrice"];
    unitsInStock = json["unitsInStock"];
  }
  Map toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "productName": productName,
      "quantityPerUnit": quantityPerUnit,
      "unitsPrice": unitsPrice,
      "unitsInStock": unitsInStock
    };
  }
}
