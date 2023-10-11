import 'package:ecommerce_app/model/ad_Banner.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/service/local%20service/local_ad_Banner_service.dart';
import 'package:ecommerce_app/service/local%20service/local_category_service.dart';
import 'package:ecommerce_app/service/local%20service/local_product_service.dart';
import 'package:ecommerce_app/service/remote_service/remote_BannerService.dart';
import 'package:ecommerce_app/service/remote_service/remote_popularCategory_service.dart';
import 'package:get/get.dart';

import '../service/remote_service/remote_popularProduct_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  //for banners
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;

  //for categories
  RxList<Category> popularCategoryList =
      List<Category>.empty(growable: true).obs;

  //for popularProductCategory

  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;

  //banner
  RxBool isBannerLoading = false.obs;

  //banner
  RxBool isPopularCategoryLoading = false.obs;

  //popularProductList
  RxBool isPopularProductLoading = false.obs;

  final LocalAdBannerService _localAdBannerService = LocalAdBannerService();
  final LocalCategoryService _localCategoryService = LocalCategoryService();
  final LocalProductService _localProductService = LocalProductService();

  @override
  void onInit() async {
    await _localAdBannerService.init();
    await _localCategoryService.init();
    await _localProductService.init();
    getAdBanners();
    getPopularProduct();
    getPopularCategories();

    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);

      //assignning local AdBanners before calling API
      if (_localAdBannerService.getAdBanners().isNotEmpty) {
        bannerList.assignAll(_localAdBannerService.getAdBanners());
      }

      //calling the API
      var result = await RemoteBannerService().get();

      //assigning API results
      if (result != null) {
        bannerList.assignAll(adBannerListFromJson(result.body));

        //save the API to local database
        _localAdBannerService.assignAllBanners(
            adBanners: adBannerListFromJson(result.body));
      }
    } finally {
      isBannerLoading(false);
    }
  }

  void getPopularCategories() async {
    try {
      //assigning local popularCategories
      isPopularCategoryLoading(true);
      if (_localCategoryService.getPopularCategories().isNotEmpty) {
        popularCategoryList
            .assignAll(_localCategoryService.getPopularCategories());
      }

      //calling api
      var result = await RemotePopularCategoryService().get();

      if (result != null) {
        popularCategoryList.assignAll(popularCategoryListFromJson(result.body));

        //saving api to db
        _localCategoryService.assignAllPopularCategories(
            popularCategories: popularCategoryListFromJson(result.body));
      }
    } finally {
      //print(popularCategoryList.length);
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProduct() async {
    try {
      isPopularProductLoading(true);
      if (_localProductService.getPopularProducts().isNotEmpty) {
        popularProductList.assignAll(_localProductService.getPopularProducts());
      }
      var result = await RemotePopularProductService().get();

      if (result != null) {
        popularProductList.assignAll(popularProductFromJson(result.body));
        _localProductService.assignAllPopularProducts(
            popularProducts: popularProductFromJson(result.body));
      }
    } finally {
      print(popularCategoryList.length);
      isPopularProductLoading(false);
    }
  }
}
