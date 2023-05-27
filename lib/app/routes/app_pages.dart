import 'package:get/get.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/Register/bindings/home_binding.dart';
import '../modules/Register/views/Register_view.dart';
import '../modules/Welcome/bindings/Welcome_binding.dart';
import '../modules/Welcome/views/Welcome_view.dart';
import '../modules/booking/binding/booking_bindings.dart';
import '../modules/booking/view/booking_page.dart';
import '../modules/dashboard/views/Home_view.dart';
import '../modules/emptyUser/emptyUser_bindings.dart';
import '../modules/emptyUser/emptyUser_page.dart';
import '../modules/product/bindings/Product_binding.dart';
import '../modules/product/views/Product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.Welcome;

  static final routes = [
    GetPage(
      name: _Paths.Welcome,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.Register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.Dasboard,
      page: () => const MyHomePage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.Product,
      page: () => ProductView(type: "all",),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.Productac,
      page: () => ProductView(type: "Air Conditioner",),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.ProductSt,
      page: () => ProductView(type: "Stove",),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.ProductWm,
      page: () => ProductView(type: "Washing Machine",),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.Booking,
      page: () => BookingPage(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.EmptyUser,
      page: () => EmptyUserPage(),
      binding: EmptyUserBindings(),
    ),
    
  ];
}
