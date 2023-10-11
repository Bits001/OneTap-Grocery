import 'package:ecommerce_app/components/mainHeader.dart';
import 'package:ecommerce_app/controller/controllers.dart';
import 'package:ecommerce_app/view/home/components/carousel_Slider/carousel_SliderView.dart';
import 'package:ecommerce_app/view/home/components/popular_category/popularCategory_loadingCard.dart';
import 'package:ecommerce_app/view/home/components/popular_product/popularProduct.dart';
import 'package:ecommerce_app/view/home/components/popular_product/popularProduct_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/carousel_Slider/carouselLoading.dart';
import 'components/popular_category/popularCategory.dart';

import 'components/sectionTitle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Obx(() {
                    if (homeController.bannerList.isNotEmpty) {
                      return CarouselSliderView(
                        bannerList: homeController.bannerList,
                      );
                    } else {
                      return const CarouselLoading();
                    }
                  }),

                  // Popular Category Sec
                  const SectionTitle(
                    title: "Popular Category",
                  ),
                  Obx(() {
                    if (homeController.popularCategoryList.isNotEmpty) {
                      return PopularCategory(
                        categories: homeController.popularCategoryList,
                      );
                    } else {
                      return const PopularCategoryLoadingCard();
                    }
                  }),

                  //Popular Product Sec
                  const SectionTitle(title: "Popular Product"),
                  Obx(() {
                    if (homeController.popularProductList.isNotEmpty) {
                      return PopularProduct(
                        popularProducts: homeController.popularProductList,
                      );
                    } else {
                      return const PopularProductLoading();
                    }
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
