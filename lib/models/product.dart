import 'package:flutter/material.dart';

class Product {
  String? id;
  String? imageUrl;
  String? productName;
  String? description;
  Color? color;
  int? price;

  Product(
      {this.productName,
      this.id,
      this.color,
      this.imageUrl,
      this.description,
      this.price});
  Product.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    imageUrl = data['imageUrl'];
    productName = data['productName'];
    description = data['description'];
    price = data['price'];
  }
  toMap() {
    return {
      'productName': productName,
      'imageUrl': imageUrl,
      'description': description,
      'price': price,
    };
  }
}
