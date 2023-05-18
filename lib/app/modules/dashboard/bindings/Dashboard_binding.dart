 import 'package:get/get.dart';
import '../controllers/Dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<DashboardController>(
      () => DashboardController(),);
  }
}
