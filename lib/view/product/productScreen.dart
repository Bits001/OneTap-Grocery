import 'package:ecommerce_app/components/mainHeader.dart';

import 'package:ecommerce_app/controller/controllers.dart';
import 'package:ecommerce_app/view/product/components/product_loadingGrid.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'components/productGrid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          MainHeader(),
          Expanded(child: Obx(
            () {
              if (productController.productList.isNotEmpty) {
                return ProductGrid(products: productController.productList);
              } else {
                return const ProductLoadingGrid();
              }
            },
          ))
        ],
      ),
    );
  }
}
