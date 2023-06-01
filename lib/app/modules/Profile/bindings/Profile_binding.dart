import 'package:get/get.dart';
import '../controllers/Profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),);
  }
}
