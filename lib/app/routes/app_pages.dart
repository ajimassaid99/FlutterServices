import 'package:get/get.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/Register/bindings/home_binding.dart';
import '../modules/Register/views/Register_view.dart';
import '../modules/Welcome/bindings/Welcome_binding.dart';
import '../modules/Welcome/views/Welcome_view.dart';
import '../modules/dashboard/views/Home_view.dart';

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
      page: () => MyHomePage(),
      binding: LoginBinding(),
    ),
    
  ];
}
