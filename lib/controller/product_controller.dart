import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/service/remote_service/remote_product.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();

  RxList<Product> productList = List<Product>.empty(growable: true).obs;

  RxBool isProductLoading = false.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isProductLoading(true);

      var result = await RemoteProductService().get();
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
       print(productList.length);
    }
  }
}
