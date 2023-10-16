import 'package:ecommerce_app/view/home/components/popular_product/popularProduct_card.dart';
import 'package:flutter/widgets.dart';

import '../../../model/product.dart';

class PopularProduct extends StatelessWidget {
  final List<Product> popularProduct;

  const PopularProduct({super.key, required this.popularProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: popularProduct.length,
        itemBuilder: (context, index) => PopularProductCard(
          product: popularProduct[index],
        ),
      ),
    );
  }
}
