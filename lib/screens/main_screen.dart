import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_demo_iki/data/api/category_api.dart';

import '../models/category.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Category> kategori = <Category>[];
  List<Widget> kategoriWidget = <Widget>[];

  @override
  void initState() {
    getCategoriesFromApi();
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
                child: Row(children: kategoriWidget),
              )
            ],
          )),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        kategori = list.map((e) => Category.fromJson(e)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < kategori.length; i++) {
      kategoriWidget.add(getCategoryWidget(kategori[i]));
    }
    return kategoriWidget;
  }

  Widget getCategoryWidget(Category myKategori) {
    return TextButton(
      onPressed: () {},
      child: Text("myKategori.categoryName",
          style: TextStyle(color: Colors.blueGrey)),
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.lightGreenAccent))),
    );
  }
}
