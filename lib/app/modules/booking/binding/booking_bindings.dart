import 'package:get/get.dart';
import '../controller/booking_controller.dart';

class BookingBinding implements Bindings {
    @override
    void dependencies() {
      Get.lazyPut<BookingController>(
      () => BookingController(),);
    }
}