import 'package:ecommerce_app/controller/category_controller.dart';
import 'package:ecommerce_app/controller/dashboard_controller.dart';
import 'package:ecommerce_app/controller/home_Controller.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());

    Get.put(HomeController());

    Get.put(ProductController());

    Get.put(CategoryController());
  }
}
