import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_demo_iki/data/api/category_api.dart';
import 'package:http_demo_iki/data/api/product_api.dart';
import 'package:http_demo_iki/models/product.dart';

import '../models/category.dart';
import '../widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Category> category = <Category>[];
  List<Widget> categoryWidgets = <Widget>[];
  List<Product> products = <Product>[];

  @override
  void initState() {
    getCategoriesFromApi();
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Alışveriş Uygulaması",
              style: TextStyle(color: Colors.white)),
          centerTitle: true),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: categoryWidgets),
              ),
              ProductListWidget(products),
            ],
          )),
    );
  }

  void getProducts() {
    ProductApi.getProducts().then((response) {
      setState(() {
        Iterable list = jsonDecode(response.body);
        products = list.map((e) => Product.fromJson(e)).toList();
      });
    });
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = jsonDecode(response.body);
        category = list.map((e) => Category.fromJson(e)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < category.length; i++) {
      categoryWidgets.add(getCategoryWidget(category[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category myKategori) {
    return TextButton(
      onPressed: () {
        getProductsByCategoryId(myKategori);
      },
      child: Text("${myKategori.categoryName}",
          style: TextStyle(color: Colors.blueGrey)),
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.lightGreenAccent))),
    );
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id!.toInt()).then((response) {
      setState(() {
        Iterable list = jsonDecode(response.body);
        products = list.map((e) => Product.fromJson(e)).toList();
      });
    });
  }
}
