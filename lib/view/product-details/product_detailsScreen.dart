import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/view/product-details/components/productCarousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProductCarouselSlider(
              images: product.images,
            )
          ],
        ),
      ),
    );
  }
}
