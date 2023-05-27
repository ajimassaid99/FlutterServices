import 'package:get/get.dart';
import './emptyUser_controller.dart';

class EmptyUserBindings implements Bindings {
    @override
    void dependencies() {
         Get.lazyPut<EmptyUserController>(
      () => EmptyUserController(),);
    }
}