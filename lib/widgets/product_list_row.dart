import 'package:flutter/material.dart';
import 'package:http_demo_iki/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  Product? product;

  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
          child: Column(
        children: [
          Container(
            child: Image.network(
              "https://www.ideasoft.com.tr/wp-content/uploads/2020/02/urun-satis-fiyati-nedir-1.jpg",
              height: MediaQuery.of(context).size.width / 3,
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
          Text("${product?.productName}",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text("${product?.unitPrice.toString()} TL"),
        ],
      )),
    );
  }
}
