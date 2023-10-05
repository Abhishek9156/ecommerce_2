import 'dart:convert';

import 'package:ecom/model/tags.dart';

List<Product> popularProductListFromJson(String val) => List<Product>.from(json
    .decode(val)['data']
    .map((val) => Product.popularProductListFromJson(val)));

List<Product> productListFromJson(String val) => List<Product>.from(json
    .decode(val)['data']
    .map((val) => Product.ProductListFromJson(val)));

class Product {
  final int id;
  final String name;
  final String description;
  final List<String> image;
  final List<Tag> tag;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.tag,
      required this.image});

  factory Product.popularProductListFromJson(Map<String, dynamic> data) =>
      Product(
          id: data["id"],
          name: data['attributes']['product']['data']['attributes']['name'],
          description: data['attributes']['product']['data']['attributes']
              ['description'],
          tag: [],
          image: List<String>.from(data['attributes']['product']['data']
                  ['attributes']['images']['data']
              .map(
            (image) => image['attributes']['url'],
          )));

  factory Product.ProductListFromJson(Map<String, dynamic> data) => Product(
      id: data["id"],
      name: data['attributes']['name'],
      description: data['attributes']['description'],
      image: List<String>.from(data['attributes']['images']['data']
          .map((image) => image['attributes']['url'])),
      tag: List<Tag>.from(data['attributes']['tags']['data'].map((val)=>Tag.fromJson(val))));
}
