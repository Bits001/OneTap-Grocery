import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/view/home/components/popular_product/popularProduct_card.dart';
import 'package:flutter/material.dart';

class PopularProduct extends StatelessWidget {
  final List<Product> popularProducts;
  const PopularProduct({super.key, required this.popularProducts});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: popularProducts.length,
        itemBuilder: (context, index) => PopularProductCard(
          product: popularProducts[index],
        ),
      ),
    );
  }
}
