import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  
  Future<void> login({
    required String email,
    required String password,
  }) async {
    final List response = await Supabase.instance.client
        .from('user')
        .select('id')
        .eq('email', email)
        .eq('password', password);
        print(response.length);

    if (response.isNotEmpty) {
      
      final userId = response[0]['id'];

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userId', userId);
    Get.snackbar('Berhasil', 'Login Berhasil');
    // Redirect to home screen
    Get.offAllNamed('/dasboard');
      return;
    }

    Get.snackbar('Error', 'Email/Password Salah');
  }
}