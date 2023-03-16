import 'dart:core';

import 'package:flutter/material.dart';

import '../models/product.dart';
import 'product_list_row.dart';

class ProductListWidget extends StatefulWidget {
  List<Product> product = <Product>[];

  ProductListWidget(List<Product> product) {
    this.product = product;
  }

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: widget.product.length,
          itemBuilder: (context, index) {
            return ProductListRowWidget(widget.product[index]);
          }),
    );
  }
}
