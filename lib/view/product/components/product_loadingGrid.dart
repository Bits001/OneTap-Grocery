import 'package:ecommerce_app/view/home/components/popular_product/popularProduct_loadingCard.dart';
import 'package:flutter/material.dart';

import '../../../model/product.dart';
import 'productCard.dart';

class ProductLoadingGrid extends StatelessWidget {
  const ProductLoadingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) => const PopularProductLoadingCard(),
    );
  }
}
