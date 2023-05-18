import 'package:get/get.dart';

import '../controllers/Register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut<RegisterController>(
      () => RegisterController());
  }
}
