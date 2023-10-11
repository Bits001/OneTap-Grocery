// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce_app/model/tags.dart';
import 'package:hive/hive.dart';
part 'product.g.dart';

List<Product> popularProductFromJson(String value) => List<Product>.from(
      json
          .decode(value)['data']
          .map((value) => Product.popularProductFromJson(value)),
    );

List<Product> productListFromJson(String value) => List<Product>.from(
      json.decode(value)['data'].map((value) => Product.productFromJson(value)),
    );

@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final List<String> images;
  @HiveField(4)
  final List<Tags> tags;

  Product({
    required this.tags,
    required this.id,
    required this.name,
    required this.description,
    required this.images,
  });

  factory Product.popularProductFromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        name: data['attributes']['product']['data']['attributes']['name'],
        description: data['attributes']['product']['data']['attributes']
            ['description'],
        images: List<String>.from(data['attributes']['product']['data']
                ['attributes']['images']['data']
            .map((image) => image['attributes']['url'])),
        tags: [],
      );

  factory Product.productFromJson(Map<String, dynamic> data) => Product(
      id: data['id'],
      name: data['attributes']['name'],
      description: data['attributes']['description'],
      images: List<String>.from(data['attributes']['images']['data']
          .map((image) => image['attributes']['url'])),
      tags: List<Tags>.from(
          data['attributes']['tags']['data'].map((val) => Tags.fromJson(val))));
}
