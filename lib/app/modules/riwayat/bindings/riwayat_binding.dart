import 'package:get/get.dart';
import '../controllers/Riwayat_controller.dart';

class RiwayatBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<RiwayatController>(
      () => RiwayatController(),);
  }
}
