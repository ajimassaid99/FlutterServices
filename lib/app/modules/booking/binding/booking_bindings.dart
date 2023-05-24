import 'package:get/get.dart';
import '../controller/booking_controller.dart';

class BookingBindings implements Bindings {
    @override
    void dependencies() {
      Get.lazyPut<BookingController>(
      () => BookingController(),);
    }
}