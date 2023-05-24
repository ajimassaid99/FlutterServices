import 'package:get/get.dart';
import '../controllers/Product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
      () => ProductController(),);
  }
}
